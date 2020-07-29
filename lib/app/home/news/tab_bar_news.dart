import 'package:flutter/material.dart';

class TabBarNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      children: <Widget>[
        Container(
          height: 60,
          color: Colors.red,
        ),
        Divider(),
        Container(
          height: 200,
          color: Colors.cyan,
        ),
        Divider(),
        Container(
          height: 300,
          color: Colors.greenAccent,
        ),
      ],
    );
  }
}
