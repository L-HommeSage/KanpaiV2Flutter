import 'package:flutter/material.dart';
import 'package:kanpai/app/home/home_page.dart';
import 'package:kanpai/app/landing_page/landing_page.dart';
import 'package:kanpai/app/sign_in/email_sign_in_model.dart';
import 'package:kanpai/app/sign_in/sign_in_page.dart';
import 'package:kanpai/generated/l10n.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LandingPage(),
        );
      case '/HomePage':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case '/Register':
        return MaterialPageRoute(
          builder: (_) => SignInPage(
            signInType: SignInType.login,
          ),
        );
      case '/second':
        //if (args is String) {
        //return MaterialPageRoute(
        //builder: (_) => SecondPage(data: args),
        //);
        //}
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text(S.of(_).errorPage),
        ),
      );
    });
  }
}
