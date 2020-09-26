import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/sake/rice_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class GridStyles extends StatelessWidget {
  const GridStyles({
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
                image: 'images/fruity.png',
                text: S.of(context).fruity),
            _buildGridTile(
                color: Colors.cyan,
                image: 'images/dessert.png',
                text: S.of(context).soft),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.orange,
                image: 'images/acid.png',
                text: S.of(context).acid),
            _buildGridTile(
                color: Colors.blueGrey,
                image: 'images/floral.jpg',
                text: S.of(context).floral),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.purple,
                image: 'images/matured.jpg',
                text: S.of(context).matured),
            _buildGridTile(
                color: Colors.indigo,
                image: 'images/earthy.png',
                text: S.of(context).earthy),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.red,
                image: 'images/round.jpg',
                text: S.of(context).round),
            _buildGridTile(
                color: Colors.cyan,
                image: 'images/fragrant.jpg',
                text: S.of(context).fragrant),
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
