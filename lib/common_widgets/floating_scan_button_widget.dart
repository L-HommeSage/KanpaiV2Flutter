import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/sake_page.dart';
import 'package:kanpai/common_widgets/new_reference_form_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/api_path.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class FloatingScanButton extends StatefulWidget {
  @override
  _FloatingScanButtonState createState() => _FloatingScanButtonState();
}

class _FloatingScanButtonState extends State<FloatingScanButton> {
  Future<void> _scan(Database database, User user) async {
    String code = '';
    code = await FlutterBarcodeScanner.scanBarcode(
            "#FF6D6D", S.of(context).cancel, false, ScanMode.BARCODE)
        .then((value) => value);
    print("=====>" + code + "<=======");
    if (code.length < 13) {
      _gotoErrorBottomSheet(code);
    } else if (code != "-1") {
      _gotoSake(database, user, code);
    }
  }

  Future<void> _gotoSake(Database database, User user, String sakeId) async {
    final sakeRef =
        Firestore.instance.document(APIPath.getSake(sakeId: sakeId));
    final doc = await sakeRef.get();
    if (!doc.exists) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return _buildNoExistForm(context, database, user, sakeId);
        },
        isScrollControlled: true,
      );
    } else {
      Sake sake = Sake.fromMap(doc.data, doc.documentID);
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => SakePage(
            database: database,
            sake: sake,
            user: user,
          ),
        ),
      );
    }
  }

  SingleChildScrollView _buildNoExistForm(
      BuildContext context, Database database, User user, String code) {
    return SingleChildScrollView(
      child: Container(
        color: kPrimaryColor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                code,
                style: TextStyle(
                    fontFamily: kFontFamilyCommonText,
                    fontSize: 20,
                    color: kPrimaryTextColor),
              ),
            ),
            Divider(),
            (user.registered == false)
                ? Text(
                    S.of(context).need_register,
                    style: TextStyle(
                      fontFamily: kFontFamilyCommonText,
                      color: kAccentColor,
                    ),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                S.of(context).no_reference,
                style: kCommonTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: kSecondaryTextColor,
                      ),
                      iconSize: 35,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                            color: (user.registered)
                                ? kAccentColor
                                : Color(0x4FFF6D6D),
                            width: 3)),
                    child: IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.check,
                        color: (user.registered)
                            ? kAccentColor
                            : Color(0x4FFF6D6D),
                      ),
                      onPressed: () {
                        if (user.registered == true) {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => NewRefPage(
                                database: database,
                                code: code,
                                user: user,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Database database = Provider.of<Database>(context, listen: false);
    final user = Provider.of<User>(context, listen: false);
    return FloatingActionButton(
      backgroundColor: kAccentColor,
      splashColor: kPrimaryTextColor,
      child: Icon(
        MdiIcons.barcodeScan,
        size: 30,
        color: kLightPrimaryColor,
      ),
      onPressed: () => _scan(database, user),
      elevation: 3,
    );
  }

  void _gotoErrorBottomSheet(String code) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: kPrimaryColor,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    code,
                    style: TextStyle(
                        fontFamily: kFontFamilyCommonText,
                        fontSize: 20,
                        color: kAccentColor),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).error_barre_code_too_short,
                    style: TextStyle(
                        color: kAccentColor,
                        fontFamily: kFontFamilyCommonText,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        );
      },
      isScrollControlled: true,
    );
  }
}
