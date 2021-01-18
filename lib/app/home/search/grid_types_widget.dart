import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/search/search_list_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

class GridTypes extends StatelessWidget {
  const GridTypes({
    Key key,
    @required this.database,
    @required this.user,
  }) : super(key: key);
  final Database database;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.red,
                image: 'images/backgroundImage.PNG',
                text: S.of(context).junmai,
                query: "Junmai"),
            _buildGridTile(
                color: Colors.cyan,
                image: 'images/backgroundImage1.PNG',
                text: S.of(context).junmai_ginjo,
                query: "Junmai Ginjo"),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.orange,
                image: 'images/backgroundImage2.PNG',
                text: S.of(context).junmai_daiginjo,
                query: "Junmai Daiginjo"),
            _buildGridTile(
                color: Colors.purple,
                image: 'images/backgroundImage3.PNG',
                text: S.of(context).ginjo,
                query: "Ginjo"),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.blueGrey,
                image: 'images/backgroundImage4.PNG',
                text: S.of(context).daiginjo,
                query: "Daiginjo"),
            _buildGridTile(
                color: Colors.indigo,
                image: 'images/backgroundImage5.PNG',
                text: S.of(context).josen,
                query: "Josen"),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.red,
                image: 'images/backgroundImage6.PNG',
                text: S.of(context).nigori,
                query: "Nigori"),
            _buildGridTile(
                color: Colors.cyan,
                image: 'images/backgroundImage7.PNG',
                text: S.of(context).sparkling,
                query: "Sparkling"),
          ],
        ),
        Container(
          height: 60,
          child: FlatButton(
            child: Center(
              child: Text(
                S.of(context).more_filters,
                style: kCommonTextStyle,
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Expanded _buildGridTile({color, image, text, query}) {
    return Expanded(
      child: OpenContainer(
        closedColor: kPrimaryColor,
        closedElevation: 0,
        openBuilder: (context, closeWidget) {
          return SearchListPage(
            title: text,
            query: query,
            queryType: "family",
            database: database,
            user: user,
          );
        },
        closedBuilder: (context, openWidget) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0x6F0D1F66),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: kFontFamilyCommonText,
                        color: kLightPrimaryColor),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
