import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/search/search_list_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

class GridStyles extends StatelessWidget {
  const GridStyles({
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
                image: 'images/fruity.png',
                text: S.of(context).fruity,
                query: "Fruity"),
            _buildGridTile(
                color: Colors.cyan,
                image: 'images/dessert.png',
                text: S.of(context).soft,
                query: "Soft"),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.orange,
                image: 'images/acid.png',
                text: S.of(context).acid,
                query: "Acid"),
            _buildGridTile(
                color: Colors.blueGrey,
                image: 'images/floral.jpg',
                text: S.of(context).floral,
                query: "Floral"),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.purple,
                image: 'images/matured.jpg',
                text: S.of(context).matured,
                query: "Matured"),
            _buildGridTile(
                color: Colors.indigo,
                image: 'images/earthy.png',
                text: S.of(context).earthy,
                query: "Earthy"),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.red,
                image: 'images/round.jpg',
                text: S.of(context).round,
                query: "Round"),
            _buildGridTile(
                color: Colors.cyan,
                image: 'images/fragrant.jpg',
                text: S.of(context).fragrant,
                query: "Fragrant"),
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
            queryType: "characteristics",
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
