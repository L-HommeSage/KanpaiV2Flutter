// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Title eng`
  String get appTitle {
    return Intl.message(
      'Title eng',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home page`
  String get pageTitle {
    return Intl.message(
      'Home page',
      name: 'pageTitle',
      desc: '',
      args: [],
    );
  }

  /// `ERROR PAGE`
  String get errorPage {
    return Intl.message(
      'ERROR PAGE',
      name: 'errorPage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure that you want to logout`
  String get logout_confirm {
    return Intl.message(
      'Are you sure that you want to logout',
      name: 'logout_confirm',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Conditions`
  String get conditions {
    return Intl.message(
      'Conditions',
      name: 'conditions',
      desc: '',
      args: [],
    );
  }

  /// `Visitor`
  String get visitor {
    return Intl.message(
      'Visitor',
      name: 'visitor',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `example@email.com`
  String get email_example {
    return Intl.message(
      'example@email.com',
      name: 'email_example',
      desc: '',
      args: [],
    );
  }

  /// `Email can't be empty`
  String get empty_email {
    return Intl.message(
      'Email can\'t be empty',
      name: 'empty_email',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get empty_pwd {
    return Intl.message(
      'Password can\'t be empty',
      name: 'empty_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Connection`
  String get connection {
    return Intl.message(
      'Connection',
      name: 'connection',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Register with Email`
  String get register_with_email {
    return Intl.message(
      'Register with Email',
      name: 'register_with_email',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Need an account? Register`
  String get need_account {
    return Intl.message(
      'Need an account? Register',
      name: 'need_account',
      desc: '',
      args: [],
    );
  }

  /// `Have an account? Sign in`
  String get have_account {
    return Intl.message(
      'Have an account? Sign in',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get facebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get google {
    return Intl.message(
      'Continue with Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Go anonymously`
  String get go_anonymously {
    return Intl.message(
      'Go anonymously',
      name: 'go_anonymously',
      desc: '',
      args: [],
    );
  }

  /// `Get honest reviews from our community.`
  String get landing_page_text_one {
    return Intl.message(
      'Get honest reviews from our community.',
      name: 'landing_page_text_one',
      desc: '',
      args: [],
    );
  }

  /// `Our app lets you discover the world's largest selection of sake, right from your phone.`
  String get landing_page_text_two {
    return Intl.message(
      'Our app lets you discover the world\'s largest selection of sake, right from your phone.',
      name: 'landing_page_text_two',
      desc: '',
      args: [],
    );
  }

  /// `Scan any bottle to learn more about the sake it contains.`
  String get landing_page_text_three {
    return Intl.message(
      'Scan any bottle to learn more about the sake it contains.',
      name: 'landing_page_text_three',
      desc: '',
      args: [],
    );
  }

  /// `Join Us`
  String get landing_page_text_four {
    return Intl.message(
      'Join Us',
      name: 'landing_page_text_four',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get register_title {
    return Intl.message(
      'Create an account',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get login_title {
    return Intl.message(
      'Welcome back',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `{counter, plural, zero{You have never pushed the button.} one{You have pushed 1 time.} other{You have pushed the button {counter} times.}}`
  String CounterText(num counter) {
    return Intl.plural(
      counter,
      zero: 'You have never pushed the button.',
      one: 'You have pushed 1 time.',
      other: 'You have pushed the button $counter times.',
      name: 'CounterText',
      desc: '',
      args: [counter],
    );
  }

  /// `Sign in failed`
  String get sign_in_failed {
    return Intl.message(
      'Sign in failed',
      name: 'sign_in_failed',
      desc: '',
      args: [],
    );
  }

  /// `The given password is invalid. Password should be at least 6 characters.`
  String get error_weak_password {
    return Intl.message(
      'The given password is invalid. Password should be at least 6 characters.',
      name: 'error_weak_password',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
      Locale.fromSubtags(languageCode: 'jp', countryCode: 'JP'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}