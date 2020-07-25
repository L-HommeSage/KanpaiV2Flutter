import 'package:flutter/material.dart';
import 'package:kanpai/common_widgets/platform_alert_dialog_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:provider/provider.dart';

class TabBarHistory extends StatelessWidget {
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
    return Center(
        child: FlatButton(
      onPressed: () => _confirmSignOut(context),
      child: Text(
        "Logout",
        style: kHeadlinesTextStyle,
      ),
    ));
  }
}
