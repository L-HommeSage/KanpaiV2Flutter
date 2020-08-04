import 'package:flutter/material.dart';

class TabBarMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/backgroundImage.PNG',
                    )),
              ),
            )),
        Expanded(flex: 1, child: Container()),
      ],
    );
  }
}
