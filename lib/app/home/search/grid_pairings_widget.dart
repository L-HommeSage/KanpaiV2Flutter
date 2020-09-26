import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/sake/rice_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class GridPairings extends StatelessWidget {
  const GridPairings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.red,
                image: 'images/viande.png',
                text: S.of(context).meat),
            _buildGridTile(
                color: Colors.cyan,
                image: 'images/poisson.png',
                text: S.of(context).fish),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.orange,
                image: 'images/friture.png',
                text: S.of(context).fried_food),
            _buildGridTile(
                color: Colors.purple,
                image: 'images/sushi.png',
                text: S.of(context).sushi),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.blueGrey,
                image: 'images/vegetarian.png',
                text: S.of(context).vegetarian),
            _buildGridTile(
                color: Colors.indigo,
                image: 'images/pasta.png',
                text: S.of(context).pasta),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.red,
                image: 'images/dessert.png',
                text: S.of(context).dessert),
            _buildGridTile(
                color: Colors.cyan,
                image: 'images/cheese.png',
                text: S.of(context).cheese),
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

  Expanded _buildGridTile({color, image, text}) {
    return Expanded(
      child: OpenContainer(
        openColor: kPrimaryColor,
        closedColor: kPrimaryColor,
        openBuilder: (context, closeWidget) {
          return RicePage();
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
