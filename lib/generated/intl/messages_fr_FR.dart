// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr_FR locale. All the
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
  String get localeName => 'fr_FR';

  static m0(counter) => "${Intl.plural(counter, zero: 'Vous n\'avez jamais appuyé.', one: 'Vous avez appuyé 1 fois.', other: 'Vous avez appuyé ${counter} fois.')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "CounterText" : m0,
    "appTitle" : MessageLookupByLibrary.simpleMessage("Titre fr"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Annuler"),
    "conditions" : MessageLookupByLibrary.simpleMessage("Conditions"),
    "confirm" : MessageLookupByLibrary.simpleMessage("confirmer"),
    "connection" : MessageLookupByLibrary.simpleMessage("connexion"),
    "email_example" : MessageLookupByLibrary.simpleMessage("exemple@email.com"),
    "empty_email" : MessageLookupByLibrary.simpleMessage("Email vide"),
    "empty_pwd" : MessageLookupByLibrary.simpleMessage("Mot de passe vide"),
    "errorPage" : MessageLookupByLibrary.simpleMessage("ERREUR PAGE"),
    "error_weak_password" : MessageLookupByLibrary.simpleMessage("Le mot de passe est invalide. Le mot de passe doit contenir au moins 6 caractères."),
    "explore" : MessageLookupByLibrary.simpleMessage("Explorer"),
    "facebook" : MessageLookupByLibrary.simpleMessage("Continuer avec Facebook"),
    "go_anonymously" : MessageLookupByLibrary.simpleMessage("Continuer anonymement"),
    "google" : MessageLookupByLibrary.simpleMessage("Continuer avec Google"),
    "have_account" : MessageLookupByLibrary.simpleMessage("J\'ai un compte? Me connecter"),
    "landing_page_text_four" : MessageLookupByLibrary.simpleMessage("Rejoins nous"),
    "landing_page_text_one" : MessageLookupByLibrary.simpleMessage("Obtenez des évaluations honnêtes de notre communauté."),
    "landing_page_text_three" : MessageLookupByLibrary.simpleMessage("Scannez n\'importe quelle bouteille pour en savoir plus sur le saké qu\'elle contient."),
    "landing_page_text_two" : MessageLookupByLibrary.simpleMessage("Notre application vous permet de découvrir la plus grande sélection de saké au monde, depuis votre téléphone."),
    "login" : MessageLookupByLibrary.simpleMessage("S\'identifier"),
    "login_title" : MessageLookupByLibrary.simpleMessage("Bienvenue"),
    "logout" : MessageLookupByLibrary.simpleMessage("Se déconnecter"),
    "logout_confirm" : MessageLookupByLibrary.simpleMessage("Êtes-vous sûr de vouloir vous déconnecter"),
    "need_account" : MessageLookupByLibrary.simpleMessage("Besoin d\'un compte? S\'inscrire"),
    "news" : MessageLookupByLibrary.simpleMessage("Actualités"),
    "next" : MessageLookupByLibrary.simpleMessage("Suivant"),
    "or" : MessageLookupByLibrary.simpleMessage("ou"),
    "pageTitle" : MessageLookupByLibrary.simpleMessage("Accueil"),
    "password" : MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "ratings" : MessageLookupByLibrary.simpleMessage("Notes"),
    "register" : MessageLookupByLibrary.simpleMessage("S\'inscrire"),
    "register_title" : MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "register_with_email" : MessageLookupByLibrary.simpleMessage("S\'incrire"),
    "search" : MessageLookupByLibrary.simpleMessage("Rechercher"),
    "settings" : MessageLookupByLibrary.simpleMessage("Paramètres"),
    "sign_in_failed" : MessageLookupByLibrary.simpleMessage("Echec de le connéxion"),
    "skip" : MessageLookupByLibrary.simpleMessage("Passer"),
    "visitor" : MessageLookupByLibrary.simpleMessage("Visiteur")
  };
}
