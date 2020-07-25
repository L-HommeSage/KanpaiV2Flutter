import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';

class HiddenDrawerMenu extends StatefulWidget {
  @override
  _HiddenDrawerMenuState createState() => _HiddenDrawerMenuState();
}

class _HiddenDrawerMenuState extends State<HiddenDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kTextIconColor, kPrimaryTextColor]),
      ),
    );
  }
}
