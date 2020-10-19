import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class FloatingScanButton extends StatefulWidget {
  @override
  _FloatingScanButtonState createState() => _FloatingScanButtonState();
}

class _FloatingScanButtonState extends State<FloatingScanButton> {
  Future<void> _scan() async {
    String code = '';
    code = await FlutterBarcodeScanner.scanBarcode(
            "#FF6D6D", S.of(context).cancel, false, ScanMode.BARCODE)
        .then((value) => value);
    print("=====>" + code + "<=======");
  }

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
      onPressed: () => _scan(),
      elevation: 3,
    );
  }
}
