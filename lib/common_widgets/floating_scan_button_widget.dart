import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/services/database.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class FloatingScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO : temporary code delete me when scan implemented
    final database = Provider.of<Database>(context);

    return FloatingActionButton(
      backgroundColor: kAccentColor,
      splashColor: kPrimaryTextColor,
      child: Icon(
        MdiIcons.barcodeScan,
        size: 30,
        color: kLightPrimaryColor,
      ),
      onPressed: () => database.readSake(),
      elevation: 3,
    );
  }
}
