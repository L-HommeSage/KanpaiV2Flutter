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

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
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

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Ratings`
  String get ratings {
    return Intl.message(
      'Ratings',
      name: 'ratings',
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

  /// `Discover`
  String get discover {
    return Intl.message(
      'Discover',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get see_more {
    return Intl.message(
      'See more',
      name: 'see_more',
      desc: '',
      args: [],
    );
  }

  /// `Learn more about Sake`
  String get learn_more_about_sake {
    return Intl.message(
      'Learn more about Sake',
      name: 'learn_more_about_sake',
      desc: '',
      args: [],
    );
  }

  /// `Today selection`
  String get today_selection {
    return Intl.message(
      'Today selection',
      name: 'today_selection',
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

  /// `In Japanese, sake literally means alcohol: rice alcohol being the oldest form of alcohol present in Japan. Japanese sake differs from Chinese "sake",which is a very strong distilled alcohol (45 °) served as a digestif.`
  String get sake_discover {
    return Intl.message(
      'In Japanese, sake literally means alcohol: rice alcohol being the oldest form of alcohol present in Japan. Japanese sake differs from Chinese "sake",which is a very strong distilled alcohol (45 °) served as a digestif.',
      name: 'sake_discover',
      desc: '',
      args: [],
    );
  }

  /// `Japan`
  String get japan {
    return Intl.message(
      'Japan',
      name: 'japan',
      desc: '',
      args: [],
    );
  }

  /// `France`
  String get france {
    return Intl.message(
      'France',
      name: 'france',
      desc: '',
      args: [],
    );
  }

  /// `Alcohol`
  String get alcohol {
    return Intl.message(
      'Alcohol',
      name: 'alcohol',
      desc: '',
      args: [],
    );
  }

  /// `Polished`
  String get polished {
    return Intl.message(
      'Polished',
      name: 'polished',
      desc: '',
      args: [],
    );
  }

  /// `Volume`
  String get volume {
    return Intl.message(
      'Volume',
      name: 'volume',
      desc: '',
      args: [],
    );
  }

  /// `Taste Characteristics`
  String get taste_characteristics {
    return Intl.message(
      'Taste Characteristics',
      name: 'taste_characteristics',
      desc: '',
      args: [],
    );
  }

  /// `Characteristics`
  String get characteristics {
    return Intl.message(
      'Characteristics',
      name: 'characteristics',
      desc: '',
      args: [],
    );
  }

  /// `Rice`
  String get rice {
    return Intl.message(
      'Rice',
      name: 'rice',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get temperature {
    return Intl.message(
      'Temperature',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `Brows Sakes`
  String get browse_sake {
    return Intl.message(
      'Brows Sakes',
      name: 'browse_sake',
      desc: '',
      args: [],
    );
  }

  /// `Search sake`
  String get search_sake {
    return Intl.message(
      'Search sake',
      name: 'search_sake',
      desc: '',
      args: [],
    );
  }

  /// `More filters`
  String get more_filters {
    return Intl.message(
      'More filters',
      name: 'more_filters',
      desc: '',
      args: [],
    );
  }

  /// `Vegetarian`
  String get vegetarian {
    return Intl.message(
      'Vegetarian',
      name: 'vegetarian',
      desc: '',
      args: [],
    );
  }

  /// `Pasta`
  String get pasta {
    return Intl.message(
      'Pasta',
      name: 'pasta',
      desc: '',
      args: [],
    );
  }

  /// `Dessert`
  String get dessert {
    return Intl.message(
      'Dessert',
      name: 'dessert',
      desc: '',
      args: [],
    );
  }

  /// `Cheese`
  String get cheese {
    return Intl.message(
      'Cheese',
      name: 'cheese',
      desc: '',
      args: [],
    );
  }

  /// `Fresh`
  String get fresh {
    return Intl.message(
      'Fresh',
      name: 'fresh',
      desc: '',
      args: [],
    );
  }

  /// `Ambient`
  String get ambient {
    return Intl.message(
      'Ambient',
      name: 'ambient',
      desc: '',
      args: [],
    );
  }

  /// `Hot`
  String get hot {
    return Intl.message(
      'Hot',
      name: 'hot',
      desc: '',
      args: [],
    );
  }

  /// `Flavor`
  String get flavor {
    return Intl.message(
      'Flavor',
      name: 'flavor',
      desc: '',
      args: [],
    );
  }

  /// `Food pairings`
  String get food_parings {
    return Intl.message(
      'Food pairings',
      name: 'food_parings',
      desc: '',
      args: [],
    );
  }

  /// `Meat`
  String get meat {
    return Intl.message(
      'Meat',
      name: 'meat',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get fish {
    return Intl.message(
      'Fish',
      name: 'fish',
      desc: '',
      args: [],
    );
  }

  /// `Sushi`
  String get sushi {
    return Intl.message(
      'Sushi',
      name: 'sushi',
      desc: '',
      args: [],
    );
  }

  /// `Fruity`
  String get fruity {
    return Intl.message(
      'Fruity',
      name: 'fruity',
      desc: '',
      args: [],
    );
  }

  /// `Acid`
  String get acid {
    return Intl.message(
      'Acid',
      name: 'acid',
      desc: '',
      args: [],
    );
  }

  /// `Soft`
  String get soft {
    return Intl.message(
      'Soft',
      name: 'soft',
      desc: '',
      args: [],
    );
  }

  /// `Floral`
  String get floral {
    return Intl.message(
      'Floral',
      name: 'floral',
      desc: '',
      args: [],
    );
  }

  /// `Fragrant`
  String get fragrant {
    return Intl.message(
      'Fragrant',
      name: 'fragrant',
      desc: '',
      args: [],
    );
  }

  /// `Round`
  String get round {
    return Intl.message(
      'Round',
      name: 'round',
      desc: '',
      args: [],
    );
  }

  /// `Earthy`
  String get earthy {
    return Intl.message(
      'Earthy',
      name: 'earthy',
      desc: '',
      args: [],
    );
  }

  /// `Matured`
  String get matured {
    return Intl.message(
      'Matured',
      name: 'matured',
      desc: '',
      args: [],
    );
  }

  /// `No sake was found`
  String get not_found {
    return Intl.message(
      'No sake was found',
      name: 'not_found',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `My sakes`
  String get my_sakes {
    return Intl.message(
      'My sakes',
      name: 'my_sakes',
      desc: '',
      args: [],
    );
  }

  /// `Fried food`
  String get fried_food {
    return Intl.message(
      'Fried food',
      name: 'fried_food',
      desc: '',
      args: [],
    );
  }

  /// `Skill`
  String get skill {
    return Intl.message(
      'Skill',
      name: 'skill',
      desc: '',
      args: [],
    );
  }

  /// `Water`
  String get water {
    return Intl.message(
      'Water',
      name: 'water',
      desc: '',
      args: [],
    );
  }

  /// `Sake`
  String get sake {
    return Intl.message(
      'Sake',
      name: 'sake',
      desc: '',
      args: [],
    );
  }

  /// `JUNMAI`
  String get junmai {
    return Intl.message(
      'JUNMAI',
      name: 'junmai',
      desc: '',
      args: [],
    );
  }

  /// `JUNMAI GINJO`
  String get junmai_ginjo {
    return Intl.message(
      'JUNMAI GINJO',
      name: 'junmai_ginjo',
      desc: '',
      args: [],
    );
  }

  /// `JUNMAI DAIGINJO`
  String get junmai_daiginjo {
    return Intl.message(
      'JUNMAI DAIGINJO',
      name: 'junmai_daiginjo',
      desc: '',
      args: [],
    );
  }

  /// `GINJO`
  String get ginjo {
    return Intl.message(
      'GINJO',
      name: 'ginjo',
      desc: '',
      args: [],
    );
  }

  /// `DAIGINJO`
  String get daiginjo {
    return Intl.message(
      'DAIGINJO',
      name: 'daiginjo',
      desc: '',
      args: [],
    );
  }

  /// `JOSEN`
  String get josen {
    return Intl.message(
      'JOSEN',
      name: 'josen',
      desc: '',
      args: [],
    );
  }

  /// `NIGORI`
  String get nigori {
    return Intl.message(
      'NIGORI',
      name: 'nigori',
      desc: '',
      args: [],
    );
  }

  /// `Sparkling`
  String get sparkling {
    return Intl.message(
      'Sparkling',
      name: 'sparkling',
      desc: '',
      args: [],
    );
  }

  /// `Sake is a traditional Japanese alcohol obtained from the fermentation of rice, titrating usually between 5 and 20 degrees.`
  String get sake_description_discover1 {
    return Intl.message(
      'Sake is a traditional Japanese alcohol obtained from the fermentation of rice, titrating usually between 5 and 20 degrees.',
      name: 'sake_description_discover1',
      desc: '',
      args: [],
    );
  }

  /// `Sake is about 80% water. 30 to 40 liters of water are needed to produce 1 liter of sake.`
  String get sake_description_discover2 {
    return Intl.message(
      'Sake is about 80% water. 30 to 40 liters of water are needed to produce 1 liter of sake.',
      name: 'sake_description_discover2',
      desc: '',
      args: [],
    );
  }

  /// `A good water is`
  String get good_water {
    return Intl.message(
      'A good water is',
      name: 'good_water',
      desc: '',
      args: [],
    );
  }

  /// `Rich in`
  String get rich_in {
    return Intl.message(
      'Rich in',
      name: 'rich_in',
      desc: '',
      args: [],
    );
  }

  /// `Low in`
  String get low_in {
    return Intl.message(
      'Low in',
      name: 'low_in',
      desc: '',
      args: [],
    );
  }

  /// `Iron`
  String get iron {
    return Intl.message(
      'Iron',
      name: 'iron',
      desc: '',
      args: [],
    );
  }

  /// `Manganese`
  String get manganese {
    return Intl.message(
      'Manganese',
      name: 'manganese',
      desc: '',
      args: [],
    );
  }

  /// `Potassium`
  String get potassium {
    return Intl.message(
      'Potassium',
      name: 'potassium',
      desc: '',
      args: [],
    );
  }

  /// `Magnesium`
  String get magnesium {
    return Intl.message(
      'Magnesium',
      name: 'magnesium',
      desc: '',
      args: [],
    );
  }

  /// `Phosphoric acid`
  String get phosphoric_acid {
    return Intl.message(
      'Phosphoric acid',
      name: 'phosphoric_acid',
      desc: '',
      args: [],
    );
  }

  /// `Hard water`
  String get hard_water {
    return Intl.message(
      'Hard water',
      name: 'hard_water',
      desc: '',
      args: [],
    );
  }

  /// `Pure water`
  String get pure_water {
    return Intl.message(
      'Pure water',
      name: 'pure_water',
      desc: '',
      args: [],
    );
  }

  /// `Rich in mineral salts\nThickness and angular feel in the mouth.`
  String get hard_water_description {
    return Intl.message(
      'Rich in mineral salts\nThickness and angular feel in the mouth.',
      name: 'hard_water_description',
      desc: '',
      args: [],
    );
  }

  /// `Refreshing, almost sweet.`
  String get pure_water_description {
    return Intl.message(
      'Refreshing, almost sweet.',
      name: 'pure_water_description',
      desc: '',
      args: [],
    );
  }

  /// `Sakes possessing textures and chews with rich and dense flavors.`
  String get hard_water_result {
    return Intl.message(
      'Sakes possessing textures and chews with rich and dense flavors.',
      name: 'hard_water_result',
      desc: '',
      args: [],
    );
  }

  /// `Fine and refreshing sakes, sweet and aromatic`
  String get pure_water_result {
    return Intl.message(
      'Fine and refreshing sakes, sweet and aromatic',
      name: 'pure_water_result',
      desc: '',
      args: [],
    );
  }

  /// `Rice`
  String get rice_title {
    return Intl.message(
      'Rice',
      name: 'rice_title',
      desc: '',
      args: [],
    );
  }

  /// `Water`
  String get water_title {
    return Intl.message(
      'Water',
      name: 'water_title',
      desc: '',
      args: [],
    );
  }

  /// `Harvest`
  String get harvest {
    return Intl.message(
      'Harvest',
      name: 'harvest',
      desc: '',
      args: [],
    );
  }

  /// `Rice is harvested usually in September`
  String get harvest_description {
    return Intl.message(
      'Rice is harvested usually in September',
      name: 'harvest_description',
      desc: '',
      args: [],
    );
  }

  /// `Polishing`
  String get polishing {
    return Intl.message(
      'Polishing',
      name: 'polishing',
      desc: '',
      args: [],
    );
  }

  /// `50 hours to polish a grain at 50%`
  String get polishing_description {
    return Intl.message(
      '50 hours to polish a grain at 50%',
      name: 'polishing_description',
      desc: '',
      args: [],
    );
  }

  /// `Washing`
  String get washing {
    return Intl.message(
      'Washing',
      name: 'washing',
      desc: '',
      args: [],
    );
  }

  /// `The rice grain is rinsed to remove its impurities`
  String get washing_description {
    return Intl.message(
      'The rice grain is rinsed to remove its impurities',
      name: 'washing_description',
      desc: '',
      args: [],
    );
  }

  /// `Soaking`
  String get soaking {
    return Intl.message(
      'Soaking',
      name: 'soaking',
      desc: '',
      args: [],
    );
  }

  /// `The rice is soaked between 1 minute and several hours`
  String get soaking_description {
    return Intl.message(
      'The rice is soaked between 1 minute and several hours',
      name: 'soaking_description',
      desc: '',
      args: [],
    );
  }

  /// `Steam cooking`
  String get steam_cooking {
    return Intl.message(
      'Steam cooking',
      name: 'steam_cooking',
      desc: '',
      args: [],
    );
  }

  /// `The rice is cooked for 45 to 60 minutes`
  String get steam_cooking_description {
    return Intl.message(
      'The rice is cooked for 45 to 60 minutes',
      name: 'steam_cooking_description',
      desc: '',
      args: [],
    );
  }

  /// `The Koji`
  String get koji {
    return Intl.message(
      'The Koji',
      name: 'koji',
      desc: '',
      args: [],
    );
  }

  /// `The koji (lit. flower of mold) is a fungus that causes sacchariﬁcation rice starch. It directly inﬂuences the taste of sake.\n\nIt is also used in a large number of food products (miso, soy sauce...).\nThe kome-koji is produced in a room heated to 35 ° C and the process takes around 48 hours. 20% of steamed rice is intended to be seeded with koji.`
  String get koji_description {
    return Intl.message(
      'The koji (lit. flower of mold) is a fungus that causes sacchariﬁcation rice starch. It directly inﬂuences the taste of sake.\n\nIt is also used in a large number of food products (miso, soy sauce...).\nThe kome-koji is produced in a room heated to 35 ° C and the process takes around 48 hours. 20% of steamed rice is intended to be seeded with koji.',
      name: 'koji_description',
      desc: '',
      args: [],
    );
  }

  /// `Koji-kin`
  String get koji_kin {
    return Intl.message(
      'Koji-kin',
      name: 'koji_kin',
      desc: '',
      args: [],
    );
  }

  /// `Koji spores:\nmicroorganism`
  String get koji_kin_description {
    return Intl.message(
      'Koji spores:\nmicroorganism',
      name: 'koji_kin_description',
      desc: '',
      args: [],
    );
  }

  /// `Koji-mai`
  String get koji_mai {
    return Intl.message(
      'Koji-mai',
      name: 'koji_mai',
      desc: '',
      args: [],
    );
  }

  /// `Steamed rice, intended to be flavored with koji-kin`
  String get koji_mai_description {
    return Intl.message(
      'Steamed rice, intended to be flavored with koji-kin',
      name: 'koji_mai_description',
      desc: '',
      args: [],
    );
  }

  /// `Kome-koji`
  String get kome_koji {
    return Intl.message(
      'Kome-koji',
      name: 'kome_koji',
      desc: '',
      args: [],
    );
  }

  /// `Rice on which koji-kin has been grown`
  String get kome_koji_description {
    return Intl.message(
      'Rice on which koji-kin has been grown',
      name: 'kome_koji_description',
      desc: '',
      args: [],
    );
  }

  /// `The essential step:\nFermentation`
  String get fermentation_title {
    return Intl.message(
      'The essential step:\nFermentation',
      name: 'fermentation_title',
      desc: '',
      args: [],
    );
  }

  /// `Omachi rice is known as the oldest identified sake rice variety, it reigned supreme nearly 70 years since its discovery in the 1860s. Origined from Okayama he is recognized for it's layered, herbal and earthy flavors`
  String get omachi_description {
    return Intl.message(
      'Omachi rice is known as the oldest identified sake rice variety, it reigned supreme nearly 70 years since its discovery in the 1860s. Origined from Okayama he is recognized for it\'s layered, herbal and earthy flavors',
      name: 'omachi_description',
      desc: '',
      args: [],
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