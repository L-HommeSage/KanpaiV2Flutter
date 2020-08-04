import 'package:flutter/material.dart';
//import 'package:kanpai/app/home/sake/sake_page.dart';
import 'package:kanpai/constants/style.dart';
//import 'package:kanpai/services/database.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:provider/provider.dart';

class FloatingScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Database database = Provider.of<Database>(context, listen: false);
    return FloatingActionButton(
      backgroundColor: kAccentColor,
      splashColor: kPrimaryTextColor,
      child: Icon(
        MdiIcons.barcodeScan,
        size: 30,
        color: kLightPrimaryColor,
      ),
      onPressed: () {},
      /*onPressed: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => SakePage(database: database),
        ),
      ),*/
      elevation: 3,
    );
  }
}
