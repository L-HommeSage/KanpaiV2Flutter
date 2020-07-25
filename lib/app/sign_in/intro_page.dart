import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kanpai/app/sign_in/conditions_page.dart';
import 'package:kanpai/app/sign_in/email_sign_in_model.dart';
import 'package:kanpai/app/sign_in/sign_in_manager.dart';
import 'package:kanpai/app/sign_in/sign_in_page.dart';
import 'package:kanpai/app/sign_in/social_button_widget.dart';
import 'package:kanpai/common_widgets/platform_exeption_alert_dialog.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({@required this.manager, @required this.isLoading});
  final SignInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (context, manager, _) => IntroPage(
              manager: manager,
              isLoading: isLoading.value,
            ),
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: S.of(context).sign_in_failed,
      exception: exception,
    ).show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await manager.signInAnonymously();
    } on PlatformException catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') _showSignInError(context, e);
    }
  }

  void _showSignInPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => SignInPage(
          signInType: SignInType.login,
        ),
      ),
    );
  }

  void _showConditionsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) => ConditionsPage()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildIntroductionScreen(context),
    );
  }

  ModalProgressHUD _buildIntroductionScreen(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: SpinKitFadingGrid(
        color: kAccentColor,
        size: 80,
      ),
      child: IntroductionScreen(
        globalBackgroundColor: kPrimaryColor,
        done: Text(
          S.of(context).conditions,
          style: TextStyle(
              fontFamily: "Lato", fontSize: 14, color: kSecondaryTextColor),
        ),
        skip: Text(
          S.of(context).skip,
          style: kCommonTextStyle,
        ),
        showSkipButton: true,
        pages: _getPages(context),
        onDone: () => _showConditionsPage(context),
        skipFlex: 0,
        nextFlex: 0,
        next: const Icon(
          Icons.arrow_forward,
          color: kPrimaryTextColor,
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: kDividerColor,
          activeColor: kAccentColor,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }

  List<PageViewModel> _getPages(BuildContext context) {
    return [
      PageViewModel(
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundImage1.PNG"),
                fit: BoxFit.cover),
            /*gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [kLightPrimaryColor, kDarkPrimaryColor],
            ),*/
          ),
        ),
        /* image: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SvgPicture.asset("images/undraw_having_fun.svg"),
        ),*/
        titleWidget:
            _buildAnimatedText(context, S.of(context).landing_page_text_one),
        body: "",
      ),
      PageViewModel(
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundImage3.PNG"),
                fit: BoxFit.cover),
          ),
          /* BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [kLightPrimaryColor, kDarkPrimaryColor],
            ),
          ),*/
        ),
        /*image: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SvgPicture.asset("images/undraw_healthy_options_sdo3.svg"),
        ),*/
        titleWidget:
            _buildAnimatedText2(context, S.of(context).landing_page_text_two),
        body: "",
      ),
      PageViewModel(
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundImage4.PNG"),
                fit: BoxFit.cover),
          ),

          /*BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [kLightPrimaryColor, kDarkPrimaryColor],
            ),
          ),*/
        ),
        /*image: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SvgPicture.asset("images/undraw_having_fun.svg"),
        ),*/
        titleWidget:
            _buildAnimatedText3(context, S.of(context).landing_page_text_three),
        body: "",
      ),
      PageViewModel(
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundImage2.PNG"),
                fit: BoxFit.cover),
          ),
          /* BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [kLightPrimaryColor, kDarkPrimaryColor],
            ),
          ),*/
        ),
        titleWidget: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            _buildAnimatedText4(context, S.of(context).landing_page_text_four),
          ],
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            SocialButton(
              color: Color(0xFF3b5998),
              textColor: Colors.white,
              onPressed: () {},
              assetName: "images/facebook-logo.png",
              text: S.of(context).facebook,
            ),
            SocialButton(
              color: Colors.white,
              textColor: kSecondaryTextColor,
              onPressed: isLoading ? null : () => _signInWithGoogle(context),
              assetName: "images/google-logo.png",
              text: S.of(context).google,
            ),
            SocialButton(
              color: kAccentColor,
              textColor: Colors.white,
              onPressed: isLoading ? null : () => _showSignInPage(context),
              icon: Icon(
                Icons.email,
                color: kLightPrimaryColor,
                size: 30,
              ),
              text: S.of(context).register_with_email,
            ),
            _buildOrDivider(context),
            RaisedButton(
              child: Text(
                S.of(context).go_anonymously,
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontFamily: 'Lato',
                  fontSize: 14,
                ),
              ),
              color: kDarkPrimaryColor,
              disabledColor: kDarkPrimaryColor,
              onPressed: isLoading ? null : () => _signInAnonymously(context),
            ),
          ],
        ),
      ),
    ];
  }

  Column _buildAnimatedText(BuildContext context, String text) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 90,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 100,
          child: TyperAnimatedTextKit(
            isRepeatingAnimation: false,
            textAlign: TextAlign.center,
            text: [
              text,
            ],
            textStyle: kHeadlinesTextStyle,
          ),
        ),
      ],
    );
  }

  Column _buildAnimatedText2(BuildContext context, String text) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 460,
        ),
        Container(
          height: 100,
          child: TyperAnimatedTextKit(
            isRepeatingAnimation: false,
            textAlign: TextAlign.center,
            text: [
              text,
            ],
            textStyle: TextStyle(
                color: kLightPrimaryColor,
                fontSize: 25,
                fontFamily: kFontFamilyHeadlines),
          ),
        ),
      ],
    );
  }

  Column _buildAnimatedText3(BuildContext context, String text) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 360,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 100,
          child: TyperAnimatedTextKit(
            isRepeatingAnimation: false,
            textAlign: TextAlign.center,
            text: [
              text,
            ],
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: kFontFamilyHeadlines),
          ),
        ),
      ],
    );
  }

  Column _buildAnimatedText4(BuildContext context, String text) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 90,
        ),
        Container(
          height: 100,
          child: TyperAnimatedTextKit(
            isRepeatingAnimation: false,
            textAlign: TextAlign.center,
            text: [
              text,
            ],
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: kFontFamilyHeadlines),
          ),
        ),
      ],
    );
  }
}

Padding _buildOrDivider(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        horizontalLine(),
        Text(
          S.of(context).or,
          style: kCommonTextStyle,
          textAlign: TextAlign.center,
        ),
        horizontalLine(),
      ],
    ),
  );
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 2,
        width: 100,
        color: Colors.black12,
      ),
    );

//   image: DecorationImage(
//       image: AssetImage("images/backgroundImage.PNG"),
//      fit: BoxFit.cover),
