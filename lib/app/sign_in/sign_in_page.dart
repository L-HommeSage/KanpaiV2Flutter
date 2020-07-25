import 'package:flutter/material.dart';
import 'package:kanpai/app/sign_in/email_sign_in_form.dart';
import 'package:kanpai/app/sign_in/email_sign_in_model.dart';
import 'package:kanpai/constants/style.dart';

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
      backgroundColor: kTextIconColor,
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          EmailSignInForm.create(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kTextIconColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kDarkPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
