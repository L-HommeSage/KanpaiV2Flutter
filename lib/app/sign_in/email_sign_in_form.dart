import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanpai/app/sign_in/email_sign_in_model.dart';
import 'package:kanpai/app/sign_in/submit_button_widget.dart';

import 'package:kanpai/common_widgets/platform_exeption_alert_dialog.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:provider/provider.dart';

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.model});
  final EmailSignInModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<EmailSignInModel>(
      create: (context) => EmailSignInModel(auth: auth),
      child: Consumer<EmailSignInModel>(
        builder: (context, model, _) => EmailSignInForm(
          model: model,
        ),
      ),
    );
  }

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _pwdFocusNode.dispose();
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await widget.model.submit();
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: S.of(context).sign_in_failed,
        exception: e,
      ).show(context);
    }
  }

  void _emailEditingComplete() {
    final newFocus = widget.model.emailValidator.isValid(widget.model.email)
        ? _pwdFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType() {
    widget.model.toggleFormType();
    _emailController.clear();
    _pwdController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          _buildTitle(context),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
                color: kLightPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
                gradient: null,
                borderRadius: BorderRadius.all(Radius.circular(
                  8,
                ))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildEmailTextField(context),
                  SizedBox(
                    height: 10,
                  ),
                  _buildPasswordTextField(context),
                  SubmitButton(
                    text: (widget.model.signInType == SignInType.register)
                        ? S.of(context).register
                        : S.of(context).login,
                    onPressed: widget.model.canSubmit ? _submit : null,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            child: Text(
              widget.model.secondaryButtonText,
              style: kCommonTextStyle,
            ),
            onPressed: !widget.model.isLoading ? _toggleFormType : null,
          ),
        ],
      ),
    );
  }

  TextField _buildEmailTextField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryTextColor)),
        labelText: "Email",
        labelStyle: TextStyle(
          color: kPrimaryTextColor,
          fontFamily: kFontFamilyHeadlines,
        ),
        enabled: widget.model.isLoading == false,
        hintText: S.of(context).email_example,
        hintStyle: kCommonTextStyle,
        errorText: widget.model.emailErrorText,
        errorStyle: TextStyle(fontFamily: kFontFamilyCommonText),
      ),
      controller: _emailController,
      focusNode: _emailFocusNode,
      onEditingComplete: _emailEditingComplete,
      onChanged: widget.model.updateEmail,
    );
  }

  TextField _buildPasswordTextField(BuildContext context) {
    return TextField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryTextColor)),
        labelText: S.of(context).password,
        enabled: widget.model.isLoading == false,
        errorText: widget.model.passwordErrorText,
        errorStyle: TextStyle(fontFamily: kFontFamilyCommonText),
        labelStyle: TextStyle(
          color: kPrimaryTextColor,
          fontFamily: kFontFamilyHeadlines,
        ),
      ),
      controller: _pwdController,
      focusNode: _pwdFocusNode,
      onEditingComplete: _submit,
      onChanged: widget.model.updatePassword,
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      (widget.model.signInType == SignInType.register)
          ? S.of(context).register_title
          : S.of(context).login_title,
      style: TextStyle(
          color: kDarkPrimaryColor,
          fontFamily: kFontFamilyHeadlines,
          fontSize: 25),
    );
  }
}
