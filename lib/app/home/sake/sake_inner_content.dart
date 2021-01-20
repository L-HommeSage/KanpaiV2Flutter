import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/country.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/pairings_panel.dart';
import 'package:kanpai/app/home/sake/reviews_panel.dart';
import 'package:kanpai/app/home/sake/bookmark_button_widget.dart';
import 'package:kanpai/app/home/sake/sake_characteristics_panel.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

class SakeInnerContent extends StatelessWidget {
  const SakeInnerContent(
      {@required this.sake, @required this.database, @required this.user});
  final Sake sake;
  final Database database;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        _buildHeaderInfo(),
        _buildStreamDescription(context),
        SizedBox(height: 8),
        _buildMainInfo(),
        SizedBox(height: 8),
        CharacteristicsPanel(sake: sake),
        PairingsPanel(sake: sake),
        SizedBox(height: 8),
        ReviewsPanel(
          sake: sake,
          database: database,
          username: user.displayName,
        ),
      ],
    );
  }

  Container _buildHeaderInfo() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${sake.name}, ${sake.family}', style: kHeadlinesTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(sake.house, style: kCommonTextStyle),
                    SizedBox(height: 5),
                    _buildFlag(sake.country),
                  ],
                ),
                BookmarkButton(
                  database: database,
                  user: user,
                  sakeId: sake.id,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _buildMainInfo() {
    return Column(
      children: <Widget>[
        Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(S.current.volume, style: kCommonTextStyle),
                Row(
                  children: <Widget>[
                    Text('${_getVolume()}', style: kHeadlinesTextStyle),
                    SizedBox(width: 4),
                    Text((sake.volume[0] >= 1000) ? 'L' : 'cL',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: kFontFamilyHeadlines,
                            color: kPrimaryTextColor)),
                  ],
                )
              ],
            ),
            Container(
              height: 35,
              width: 1,
              color: kSecondaryTextColor,
            ),
            Column(
              children: <Widget>[
                Text(S.current.polished, style: kCommonTextStyle),
                Row(
                  children: <Widget>[
                    Text('${sake.polished.toString()}',
                        style: kHeadlinesTextStyle),
                    SizedBox(width: 4),
                    Text('%',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: kFontFamilyHeadlines,
                            color: kPrimaryTextColor)),
                  ],
                )
              ],
            ),
            Container(
              height: 35,
              width: 1,
              color: kSecondaryTextColor,
            ),
            Column(
              children: <Widget>[
                Text(S.current.alcohol, style: kCommonTextStyle),
                Row(
                  children: <Widget>[
                    Text('${sake.alcohol.toString()}',
                        style: kHeadlinesTextStyle),
                    SizedBox(width: 4),
                    Text('%',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: kFontFamilyHeadlines,
                            color: kPrimaryTextColor)),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  double _getVolume() {
    double volume = 0;
    if (sake.volume[0] >= 1000) {
      volume = sake.volume[0].toDouble() / 1000;
    } else {
      volume = sake.volume[0].toDouble() / 10;
    }

    return volume;
  }

  Row _buildFlag(String country) {
    return Row(
      children: <Widget>[
        ClipOval(
          child: Flag(
            Country().getCountryFlag(country),
            height: 20,
            width: 20,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '${sake.region}, ${Country().getCountryName(country)}',
          style: TextStyle(
              fontSize: 12,
              fontFamily: kFontFamilyCommonText,
              color: kSecondaryTextColor),
        ),
      ],
    );
  }

  StreamBuilder<Sake> _buildStreamDescription(BuildContext context) {
    return StreamBuilder<Sake>(
      stream: _getCurrentLanguageSelected(sake.id, context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Some error occurred'));
        }
        if (snapshot.hasData) {
          final sake = snapshot.data;
          return (sake.description != "")
              ? Column(
                  children: <Widget>[
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Text(
                        sake.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: kFontFamilyCommonText,
                            fontSize: 16,
                            color: kTextIconColor),
                      ),
                    ),
                  ],
                )
              : SizedBox();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Stream<Sake> _getCurrentLanguageSelected(
      String sakeId, BuildContext context) {
    if (Localizations.localeOf(context).languageCode == 'en') {
      return database.sakeDescriptionStreamEn(sakeId);
    } else if (Localizations.localeOf(context).languageCode == 'fr') {
      return database.sakeDescriptionStreamFr(sakeId);
    } else if (Localizations.localeOf(context).languageCode == 'jp') {
      return database.sakeDescriptionStreamJp(sakeId);
    } else {
      return database.sakeDescriptionStreamEn(sakeId);
    }
  }
}
