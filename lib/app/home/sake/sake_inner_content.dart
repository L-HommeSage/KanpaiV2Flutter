import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/sake_characteristics_panel.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/database.dart';

class SakeInnerContent extends StatelessWidget {
  const SakeInnerContent({@required this.sake, @required this.database});
  final Sake sake;
  final Database database;

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
        Divider(),
        // SizedBox(height: 8),
        // _buildStackedImageTitle(),
        SizedBox(height: 8),
        CharacteristicsPanel(sake: sake),
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
            Text(sake.house, style: kCommonTextStyle),
            SizedBox(height: 5),
            _buildFlag(sake.country),
          ],
        ),
      ),
    );
  }

  Center _buildCharacteristicsTitle() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: Color(0xDEFFF7F1),
            border: Border.all(color: kDividerColor, width: 1),
            borderRadius: BorderRadius.circular(3)),
        child: Text('  ${S.current.characteristics}  ',
            style: kHeadlinesTextStyle),
      ),
    );
  }

  Row _buildMainInfo() {
    return Row(
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
                Text('${sake.polished.toString()}', style: kHeadlinesTextStyle),
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
                Text('${sake.alcohol.toString()}', style: kHeadlinesTextStyle),
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
    if (country == 'Japan') {
      return Row(
        children: <Widget>[
          ClipOval(
            child: Flag(
              "jp",
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            '${sake.region}, ${S.current.japan}',
            style: TextStyle(
                fontSize: 12,
                fontFamily: kFontFamilyCommonText,
                color: kSecondaryTextColor),
          ),
        ],
      );
    } else if (country == 'France') {
      return Row(
        children: <Widget>[
          ClipOval(
            child: Flag(
              "fr",
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '${sake.region}, ${S.current.france}',
            style: TextStyle(
                fontSize: 12,
                fontFamily: kFontFamilyCommonText,
                color: kDividerColor),
          ),
        ],
      );
    } else {
      return Row();
    }
  }

  StreamBuilder<Sake> _buildStreamDescription(BuildContext context) {
    return StreamBuilder<Sake>(
      stream: _getCurrentLanguageSelected('3256223100226', context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Some error occurred'));
        }
        if (snapshot.hasData) {
          final sake = snapshot.data;
          return Column(
            children: <Widget>[
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  sake.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontFamily: kFontFamilyCommonText,
                      fontSize: 16,
                      color: kTextIconColor),
                ),
              ),
              Divider(),
            ],
          );
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

  Stack _buildStackedImageTitle() {
    return Stack(
      children: <Widget>[
        Center(
          child: Image.asset(
            'images/wave1.png',
            height: 90,
          ),
        ),
        Transform.translate(
            offset: Offset(0, 26), child: _buildCharacteristicsTitle()),
      ],
    );
  }

  Container _buildLoremIpsum() {
    return Container(
      child: Text(kLoremIpsum),
    );
  }
}
