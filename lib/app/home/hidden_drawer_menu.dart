import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/common_widgets/platform_alert_dialog_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HiddenDrawerMenu extends StatelessWidget {
  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOUt = await PlatformAlertDialog(
      title: S.of(context).logout,
      content: S.of(context).logout_confirm,
      defaultActionText: S.of(context).confirm,
      cancelActionText: S.of(context).cancel,
    ).show(context);

    if (didRequestSignOUt == true) {
      _signOut(context);
    }
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryTextColor, kTextIconColor]),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHeader(),
            _buildContent(),
            _buildFooter(context)
          ],
        ),
      ),
    );
  }

  Column _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildDrawerFlatButton(MdiIcons.bottleWine, () {}, "Mes sakés"),
        _buildDrawerDivider(),
        _buildDrawerFlatButton(MdiIcons.star, () {}, "Mes notes"),
        _buildDrawerDivider(),
        _buildDrawerFlatButton(Icons.bookmark, () {}, "Marque page"),
        _buildDrawerDivider(),
        _buildDrawerFlatButton(Icons.people, () {}, "Amis"),
        _buildDrawerDivider(),
        _buildDrawerFlatButton(Icons.shopping_cart, () {}, "Commandes"),
      ],
    );
  }

  Padding _buildDrawerDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(width: 200, height: 2, color: kAccentColor),
    );
  }

  FlatButton _buildDrawerFlatButton(
      IconData icon, Function onPressed, String text) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: kSecondaryTextColor,
          ),
          SizedBox(width: 6),
          Text(
            text,
            style: kCommonTextStyle,
          )
        ],
      ),
      onPressed: onPressed,
    );
  }

  FlatButton _buildFooterFlatButton(
      IconData icon, Function onPressed, String text) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: kSecondaryTextColor,
          ),
          SizedBox(width: 6),
          Text(
            text,
            style: kCommonTextStyle,
          )
        ],
      ),
      onPressed: onPressed,
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
          ),
          SizedBox(width: 10),
          Column(
            children: <Widget>[
              Text(
                "Username",
                style: kDarkHeadlinesTextStyle,
              ),
              Row(children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: kSecondaryTextColor,
                ),
                Text(
                  "France, Paris",
                  style: kCommonTextStyle,
                )
              ])
            ],
          )
        ],
      ),
    );
  }

  Row _buildFooter(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 6),
        _buildFooterFlatButton(Icons.settings, () {}, S.of(context).settings),
        Container(
          width: 2,
          height: 20,
          color: kSecondaryTextColor,
        ),
        _buildFooterFlatButton(Icons.exit_to_app,
            () => _confirmSignOut(context), S.of(context).logout),
      ],
    );
  }
}
