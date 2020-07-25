// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a jp_JP locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'jp_JP';

  static m0(counter) => "${Intl.plural(counter, zero: 'Vous n\'avez jamais appuyé.', other: 'Vous avez appuyé ${counter} fois.')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "CounterText" : m0,
    "appTitle" : MessageLookupByLibrary.simpleMessage("Titre JP"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "conditions" : MessageLookupByLibrary.simpleMessage("Conditions"),
    "confirm" : MessageLookupByLibrary.simpleMessage("confirm"),
    "connection" : MessageLookupByLibrary.simpleMessage("Connection"),
    "email_example" : MessageLookupByLibrary.simpleMessage("example@email.com"),
    "empty_email" : MessageLookupByLibrary.simpleMessage("Email can\'t be empty"),
    "empty_pwd" : MessageLookupByLibrary.simpleMessage("Password can\'t be empty"),
    "errorPage" : MessageLookupByLibrary.simpleMessage("ERROR PAGE"),
    "error_weak_password" : MessageLookupByLibrary.simpleMessage("The given password is to invalid. Password should be at least 6 characters."),
    "facebook" : MessageLookupByLibrary.simpleMessage("Continue with Facebook"),
    "go_anonymously" : MessageLookupByLibrary.simpleMessage("Go anonymously"),
    "google" : MessageLookupByLibrary.simpleMessage("Continue with Google"),
    "have_account" : MessageLookupByLibrary.simpleMessage("Have an account? Sign in"),
    "landing_page_text_four" : MessageLookupByLibrary.simpleMessage("Rejoins nous"),
    "landing_page_text_one" : MessageLookupByLibrary.simpleMessage("Get honest reviews from our community."),
    "landing_page_text_three" : MessageLookupByLibrary.simpleMessage("Scan any bottle to learn more about the sake it contains."),
    "landing_page_text_two" : MessageLookupByLibrary.simpleMessage("Our app lets you discover the world\'s largest selection of sake, right from your phone."),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "login_title" : MessageLookupByLibrary.simpleMessage("Welcome back"),
    "logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "logout_confirm" : MessageLookupByLibrary.simpleMessage("Are you sure that you want to logout"),
    "need_account" : MessageLookupByLibrary.simpleMessage("Need an account? Register"),
    "next" : MessageLookupByLibrary.simpleMessage("Next"),
    "or" : MessageLookupByLibrary.simpleMessage("or"),
    "pageTitle" : MessageLookupByLibrary.simpleMessage("japanese"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "register" : MessageLookupByLibrary.simpleMessage("Register"),
    "register_title" : MessageLookupByLibrary.simpleMessage("登録"),
    "register_with_email" : MessageLookupByLibrary.simpleMessage("Register with email"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "sign_in_failed" : MessageLookupByLibrary.simpleMessage("Sign in failed"),
    "skip" : MessageLookupByLibrary.simpleMessage("Skip"),
    "visitor" : MessageLookupByLibrary.simpleMessage("Visitor")
  };
}
