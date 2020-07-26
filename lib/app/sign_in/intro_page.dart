import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kanpai/app/sign_in/email_sign_in_model.dart';
import 'package:kanpai/app/sign_in/social_sign_in_manager.dart';
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
  final SocialSignInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SocialSignInManager>(
          create: (_) => SocialSignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SocialSignInManager>(
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
        globalBackgroundColor: kTextIconColor,
        done: Text(
          S.of(context).visitor,
          style: TextStyle(
              fontFamily: "Lato", fontSize: 14, color: kLightPrimaryColor),
        ),
        skip: Text(
          S.of(context).skip,
          style: kCommonTextStyle,
        ),
        showSkipButton: true,
        pages: _getPages(context),
        onDone: () => _signInAnonymously(context),
        skipFlex: 0,
        nextFlex: 0,
        next: const Icon(
          Icons.arrow_forward,
          color: kLightPrimaryColor,
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
          ),
        ),
        titleWidget: _buildAnimatedText(
            context,
            S.of(context).landing_page_text_one,
            MediaQuery.of(context).size.height / 6,
            kPrimaryTextColor),
        body: "",
      ),
      PageViewModel(
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundImage3.PNG"),
                fit: BoxFit.cover),
          ),
        ),
        titleWidget: _buildAnimatedText(
            context,
            S.of(context).landing_page_text_two,
            MediaQuery.of(context).size.height / 1.4,
            kLightPrimaryColor),
        body: "",
      ),
      PageViewModel(
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundImage4.PNG"),
                fit: BoxFit.cover),
          ),
        ),
        titleWidget: _buildAnimatedText(
            context,
            S.of(context).landing_page_text_three,
            MediaQuery.of(context).size.height / 2,
            kLightPrimaryColor),
        body: "",
      ),
      PageViewModel(
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundImage2.PNG"),
                fit: BoxFit.cover),
          ),
        ),
        titleWidget: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            _buildAnimatedText(context, S.of(context).landing_page_text_four,
                90, kLightPrimaryColor),
          ],
        ),
        bodyWidget: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        footer: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
          ],
        ),
      ),
    ];
  }

  Column _buildAnimatedText(
      BuildContext context, String text, double height, Color textColor) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: height,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TyperAnimatedTextKit(
            isRepeatingAnimation: false,
            textAlign: TextAlign.center,
            text: [
              text,
            ],
            textStyle: TextStyle(
                color: textColor,
                fontSize: 25,
                fontFamily: kFontFamilyHeadlines),
          ),
        ),
      ],
    );
  }
}

//   image: DecorationImage(
//       image: AssetImage("images/backgroundImage.PNG"),
//      fit: BoxFit.cover),
