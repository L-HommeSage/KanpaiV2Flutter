import 'package:flutter/material.dart';
import 'package:kanpai/app/sign_in/email_sign_in_container_widget.dart';
import 'package:kanpai/app/sign_in/email_sign_in_model.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({@required this.signInType});
  final SignInType signInType;

  @override
  Widget build(BuildContext context) {
    return _buildChildren(context);
  }

  Scaffold _buildChildren(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          EmailSignInForm.create(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        (signInType == SignInType.register)
            ? S.of(context).register_title
            : S.of(context).login_title,
        style: kHeadlinesTextStyle,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryTextColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
