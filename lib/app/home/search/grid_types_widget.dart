import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class GridTypes extends StatelessWidget {
  const GridTypes({
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
                image: 'images/viande.png',
                text: 'okok'),
            _buildGridTile(
                color: Colors.indigo, image: 'images/viande.png', text: 'okok'),
          ],
        ),
        Row(
          children: <Widget>[
            _buildGridTile(
                color: Colors.red, image: 'images/viande.png', text: 'okok'),
            _buildGridTile(
                color: Colors.cyan, image: 'images/viande.png', text: 'okok'),
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
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          height: 150,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x8F0D1F66),
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
      ),
    );
  }
}
