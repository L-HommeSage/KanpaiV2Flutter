import 'package:flag/flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
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
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${sake.name}, ${sake.family}',
                    style: kHeadlinesTextStyle),
                Text(sake.house, style: kCommonTextStyle),
                SizedBox(height: 5),
                _buildFlag(sake.country),
              ],
            ),
          ),
        ),
        _buildStreamDescription(context),
        _buildMainInfo()
      ],
    );
  }

  Row _buildMainInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[Text("alcohol"), Text(sake.alcohol.toString())],
        ),
        Container(
          height: 30,
          width: 2,
          color: kSecondaryTextColor,
        ),
        Column(
          children: <Widget>[Text("alcohol"), Text(sake.alcohol.toString())],
        ),
        Container(
          height: 30,
          width: 2,
          color: kSecondaryTextColor,
        ),
        Column(
          children: <Widget>[Text("alcohol"), Text(sake.alcohol.toString())],
        ),
      ],
    );
  }

  Container _buildLoremIpsum() {
    return Container(
      child: Text(kLoremIpsum),
    );
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
                      fontSize: 14,
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
}
