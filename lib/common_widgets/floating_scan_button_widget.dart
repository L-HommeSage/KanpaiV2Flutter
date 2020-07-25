import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FloatingScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kAccentColor,
      splashColor: kPrimaryTextColor,
      child: Icon(
        MdiIcons.barcodeScan,
        size: 30,
        color: kLightPrimaryColor,
      ),
      onPressed: () {},
      elevation: 3,
    );
  }
}
