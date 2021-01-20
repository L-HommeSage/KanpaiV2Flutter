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

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
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

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Pairing`
  String get pairing {
    return Intl.message(
      'Pairing',
      name: 'pairing',
      desc: '',
      args: [],
    );
  }

  /// `Style`
  String get style {
    return Intl.message(
      'Style',
      name: 'style',
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

  /// `Browse Sakes`
  String get browse_sake {
    return Intl.message(
      'Browse Sakes',
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

  /// `No sake was found`
  String get not_found {
    return Intl.message(
      'No sake was found',
      name: 'not_found',
      desc: '',
      args: [],
    );
  }

  /// `Commonly search`
  String get commonly_search {
    return Intl.message(
      'Commonly search',
      name: 'commonly_search',
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

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks`
  String get bookmarks {
    return Intl.message(
      'Bookmarks',
      name: 'bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `Added to your bookmarks`
  String get added_bookmarks {
    return Intl.message(
      'Added to your bookmarks',
      name: 'added_bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `Removed from your bookmarks`
  String get removed_bookmarks {
    return Intl.message(
      'Removed from your bookmarks',
      name: 'removed_bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `My rates`
  String get my_rates {
    return Intl.message(
      'My rates',
      name: 'my_rates',
      desc: '',
      args: [],
    );
  }

  /// `You must be registered to use this feature`
  String get need_register {
    return Intl.message(
      'You must be registered to use this feature',
      name: 'need_register',
      desc: '',
      args: [],
    );
  }

  /// `We don't have this reference, would you like to fill it in order to improve our services ?`
  String get no_reference {
    return Intl.message(
      'We don\'t have this reference, would you like to fill it in order to improve our services ?',
      name: 'no_reference',
      desc: '',
      args: [],
    );
  }

  /// `Read all reviews`
  String get read_all_reviews {
    return Intl.message(
      'Read all reviews',
      name: 'read_all_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Feel free to review ?`
  String get free_review {
    return Intl.message(
      'Feel free to review ?',
      name: 'free_review',
      desc: '',
      args: [],
    );
  }

  /// `Please join a grade to your review`
  String get please_grade {
    return Intl.message(
      'Please join a grade to your review',
      name: 'please_grade',
      desc: '',
      args: [],
    );
  }

  /// `Add a review`
  String get add_reviews {
    return Intl.message(
      'Add a review',
      name: 'add_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Want to be the first ?`
  String get be_first {
    return Intl.message(
      'Want to be the first ?',
      name: 'be_first',
      desc: '',
      args: [],
    );
  }

  /// `New reference`
  String get new_ref {
    return Intl.message(
      'New reference',
      name: 'new_ref',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thank_you {
    return Intl.message(
      'Thank you',
      name: 'thank_you',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Make your choice`
  String get make_choice {
    return Intl.message(
      'Make your choice',
      name: 'make_choice',
      desc: '',
      args: [],
    );
  }

  /// `More information you want to add`
  String get more_info {
    return Intl.message(
      'More information you want to add',
      name: 'more_info',
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

  /// `Between 5°C and 15°C`
  String get temperature_desc_1 {
    return Intl.message(
      'Between 5°C and 15°C',
      name: 'temperature_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Between 16°C and 20°C`
  String get temperature_desc_2 {
    return Intl.message(
      'Between 16°C and 20°C',
      name: 'temperature_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Between 21°C and 50°C`
  String get temperature_desc_3 {
    return Intl.message(
      'Between 21°C and 50°C',
      name: 'temperature_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Depending on the season, cold in summer warm in winter`
  String get temperature_desc_4 {
    return Intl.message(
      'Depending on the season, cold in summer warm in winter',
      name: 'temperature_desc_4',
      desc: '',
      args: [],
    );
  }

  /// `Depending on the season, cold in summer hot in winter`
  String get temperature_desc_5 {
    return Intl.message(
      'Depending on the season, cold in summer hot in winter',
      name: 'temperature_desc_5',
      desc: '',
      args: [],
    );
  }

  /// `Depending on the season, warm in summer hot in winter`
  String get temperature_desc_6 {
    return Intl.message(
      'Depending on the season, warm in summer hot in winter',
      name: 'temperature_desc_6',
      desc: '',
      args: [],
    );
  }

  /// `Have fun`
  String get temperature_desc_7 {
    return Intl.message(
      'Have fun',
      name: 'temperature_desc_7',
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

  /// `Norway`
  String get norway {
    return Intl.message(
      'Norway',
      name: 'norway',
      desc: '',
      args: [],
    );
  }

  /// `China`
  String get china {
    return Intl.message(
      'China',
      name: 'china',
      desc: '',
      args: [],
    );
  }

  /// `South Korea`
  String get south_korea {
    return Intl.message(
      'South Korea',
      name: 'south_korea',
      desc: '',
      args: [],
    );
  }

  /// `Canada`
  String get canada {
    return Intl.message(
      'Canada',
      name: 'canada',
      desc: '',
      args: [],
    );
  }

  /// `Brazil`
  String get brazil {
    return Intl.message(
      'Brazil',
      name: 'brazil',
      desc: '',
      args: [],
    );
  }

  /// `Australia`
  String get australia {
    return Intl.message(
      'Australia',
      name: 'australia',
      desc: '',
      args: [],
    );
  }

  /// `Vietnam`
  String get vietnam {
    return Intl.message(
      'Vietnam',
      name: 'vietnam',
      desc: '',
      args: [],
    );
  }

  /// `Thailand`
  String get thailand {
    return Intl.message(
      'Thailand',
      name: 'thailand',
      desc: '',
      args: [],
    );
  }

  /// `Singapore`
  String get singapore {
    return Intl.message(
      'Singapore',
      name: 'singapore',
      desc: '',
      args: [],
    );
  }

  /// `Germany`
  String get germany {
    return Intl.message(
      'Germany',
      name: 'germany',
      desc: '',
      args: [],
    );
  }

  /// `United Kingdom`
  String get united_kingdom {
    return Intl.message(
      'United Kingdom',
      name: 'united_kingdom',
      desc: '',
      args: [],
    );
  }

  /// `Romania`
  String get romania {
    return Intl.message(
      'Romania',
      name: 'romania',
      desc: '',
      args: [],
    );
  }

  /// `Spain`
  String get spain {
    return Intl.message(
      'Spain',
      name: 'spain',
      desc: '',
      args: [],
    );
  }

  /// `Italy`
  String get italy {
    return Intl.message(
      'Italy',
      name: 'italy',
      desc: '',
      args: [],
    );
  }

  /// `United States`
  String get united_states {
    return Intl.message(
      'United States',
      name: 'united_states',
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

  /// `Omachi rice is known as the oldest identified sake rice variety, it reigned supreme nearly 70 years since its discovery in the 1860s. Origined from Okayama he is recognized for it's layered, herbal and earthy flavors`
  String get omachi_description {
    return Intl.message(
      'Omachi rice is known as the oldest identified sake rice variety, it reigned supreme nearly 70 years since its discovery in the 1860s. Origined from Okayama he is recognized for it\'s layered, herbal and earthy flavors',
      name: 'omachi_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get yamada_nishiki_description {
    return Intl.message(
      '',
      name: 'yamada_nishiki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get gohyakumangoku_description {
    return Intl.message(
      '',
      name: 'gohyakumangoku_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get miyama_nishiki_description {
    return Intl.message(
      '',
      name: 'miyama_nishiki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dewasansan_description {
    return Intl.message(
      '',
      name: 'dewasansan_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get kame_no_o_description {
    return Intl.message(
      '',
      name: 'kame_no_o_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ginpu_description {
    return Intl.message(
      '',
      name: 'ginpu_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get akita_sake_komachi_description {
    return Intl.message(
      '',
      name: 'akita_sake_komachi_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ginginga_description {
    return Intl.message(
      '',
      name: 'ginginga_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get watari_bune_description {
    return Intl.message(
      '',
      name: 'watari_bune_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get tamazakae_description {
    return Intl.message(
      '',
      name: 'tamazakae_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hattan_nishiki_description {
    return Intl.message(
      '',
      name: 'hattan_nishiki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get oseto_description {
    return Intl.message(
      '',
      name: 'oseto_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get aiyama_description {
    return Intl.message(
      '',
      name: 'aiyama_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dewa_no_sato_description {
    return Intl.message(
      '',
      name: 'dewa_no_sato_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ginfubuki_description {
    return Intl.message(
      '',
      name: 'ginfubuki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ginnosato_description {
    return Intl.message(
      '',
      name: 'ginnosato_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ginnosei_description {
    return Intl.message(
      '',
      name: 'ginnosei_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ginotome_description {
    return Intl.message(
      '',
      name: 'ginotome_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get goriki_description {
    return Intl.message(
      '',
      name: 'goriki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hanafubuki_description {
    return Intl.message(
      '',
      name: 'hanafubuki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hakutsuru_nishiki_description {
    return Intl.message(
      '',
      name: 'hakutsuru_nishiki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hattan_description {
    return Intl.message(
      '',
      name: 'hattan_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hattanso_description {
    return Intl.message(
      '',
      name: 'hattanso_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hidahomare_description {
    return Intl.message(
      '',
      name: 'hidahomare_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hitogokochi_description {
    return Intl.message(
      '',
      name: 'hitogokochi_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hyogo_kita_nishiki_description {
    return Intl.message(
      '',
      name: 'hyogo_kita_nishiki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hyogo_yume_nishiki_description {
    return Intl.message(
      '',
      name: 'hyogo_yume_nishiki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hoshi_akari_description {
    return Intl.message(
      '',
      name: 'hoshi_akari_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get iwai_description {
    return Intl.message(
      '',
      name: 'iwai_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get kan_no_mai_description {
    return Intl.message(
      '',
      name: 'kan_no_mai_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get koshihikari_description {
    return Intl.message(
      '',
      name: 'koshihikari_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get koshi_tanrei_description {
    return Intl.message(
      '',
      name: 'koshi_tanrei_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get kura_no_hana_description {
    return Intl.message(
      '',
      name: 'kura_no_hana_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get saka_nishiki_description {
    return Intl.message(
      '',
      name: 'saka_nishiki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get senbon_nishiki_description {
    return Intl.message(
      '',
      name: 'senbon_nishiki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get shinriki_description {
    return Intl.message(
      '',
      name: 'shinriki_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get yamadaho_description {
    return Intl.message(
      '',
      name: 'yamadaho_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get yume_no_kaori_description {
    return Intl.message(
      '',
      name: 'yume_no_kaori_description',
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

  /// `Aged`
  String get aged {
    return Intl.message(
      'Aged',
      name: 'aged',
      desc: '',
      args: [],
    );
  }

  /// `Dry`
  String get dry {
    return Intl.message(
      'Dry',
      name: 'dry',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Mellow`
  String get mellow {
    return Intl.message(
      'Mellow',
      name: 'mellow',
      desc: '',
      args: [],
    );
  }

  /// `Rich`
  String get rich {
    return Intl.message(
      'Rich',
      name: 'rich',
      desc: '',
      args: [],
    );
  }

  /// `Refined`
  String get refined {
    return Intl.message(
      'Refined',
      name: 'refined',
      desc: '',
      args: [],
    );
  }

  /// `Sweet`
  String get sweet {
    return Intl.message(
      'Sweet',
      name: 'sweet',
      desc: '',
      args: [],
    );
  }

  /// `Peach`
  String get peach {
    return Intl.message(
      'Peach',
      name: 'peach',
      desc: '',
      args: [],
    );
  }

  /// `Aromatic`
  String get aromatic {
    return Intl.message(
      'Aromatic',
      name: 'aromatic',
      desc: '',
      args: [],
    );
  }

  /// `Grilled rice`
  String get grilled_rice {
    return Intl.message(
      'Grilled rice',
      name: 'grilled_rice',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Balanced`
  String get balanced {
    return Intl.message(
      'Balanced',
      name: 'balanced',
      desc: '',
      args: [],
    );
  }

  /// `Mineral`
  String get mineral {
    return Intl.message(
      'Mineral',
      name: 'mineral',
      desc: '',
      args: [],
    );
  }

  /// `Long`
  String get long {
    return Intl.message(
      'Long',
      name: 'long',
      desc: '',
      args: [],
    );
  }

  /// `Melon`
  String get melon {
    return Intl.message(
      'Melon',
      name: 'melon',
      desc: '',
      args: [],
    );
  }

  /// `Delicate`
  String get delicate {
    return Intl.message(
      'Delicate',
      name: 'delicate',
      desc: '',
      args: [],
    );
  }

  /// `Caramelized`
  String get caramelized {
    return Intl.message(
      'Caramelized',
      name: 'caramelized',
      desc: '',
      args: [],
    );
  }

  /// `Ripe fruit`
  String get ripe_fruit {
    return Intl.message(
      'Ripe fruit',
      name: 'ripe_fruit',
      desc: '',
      args: [],
    );
  }

  /// `Banana`
  String get banana {
    return Intl.message(
      'Banana',
      name: 'banana',
      desc: '',
      args: [],
    );
  }

  /// `Powerful`
  String get powerful {
    return Intl.message(
      'Powerful',
      name: 'powerful',
      desc: '',
      args: [],
    );
  }

  /// `Woody`
  String get woody {
    return Intl.message(
      'Woody',
      name: 'woody',
      desc: '',
      args: [],
    );
  }

  /// `Silky`
  String get silky {
    return Intl.message(
      'Silky',
      name: 'silky',
      desc: '',
      args: [],
    );
  }

  /// `Bitterness`
  String get bitterness {
    return Intl.message(
      'Bitterness',
      name: 'bitterness',
      desc: '',
      args: [],
    );
  }

  /// `Elegant`
  String get elegant {
    return Intl.message(
      'Elegant',
      name: 'elegant',
      desc: '',
      args: [],
    );
  }

  /// `Pepper`
  String get pepper {
    return Intl.message(
      'Pepper',
      name: 'pepper',
      desc: '',
      args: [],
    );
  }

  /// `Tasty`
  String get tasty {
    return Intl.message(
      'Tasty',
      name: 'tasty',
      desc: '',
      args: [],
    );
  }

  /// `Complex`
  String get complex {
    return Intl.message(
      'Complex',
      name: 'complex',
      desc: '',
      args: [],
    );
  }

  /// `Off-dry`
  String get off_dry {
    return Intl.message(
      'Off-dry',
      name: 'off_dry',
      desc: '',
      args: [],
    );
  }

  /// `Pear`
  String get pear {
    return Intl.message(
      'Pear',
      name: 'pear',
      desc: '',
      args: [],
    );
  }

  /// `Grape`
  String get grape {
    return Intl.message(
      'Grape',
      name: 'grape',
      desc: '',
      args: [],
    );
  }

  /// `Traditional`
  String get traditional {
    return Intl.message(
      'Traditional',
      name: 'traditional',
      desc: '',
      args: [],
    );
  }

  /// `Rice flavor`
  String get rice_flavor {
    return Intl.message(
      'Rice flavor',
      name: 'rice_flavor',
      desc: '',
      args: [],
    );
  }

  /// `Racy`
  String get racy {
    return Intl.message(
      'Racy',
      name: 'racy',
      desc: '',
      args: [],
    );
  }

  /// `Aniseed`
  String get aniseed {
    return Intl.message(
      'Aniseed',
      name: 'aniseed',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message(
      'Premium',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `Pure`
  String get pure {
    return Intl.message(
      'Pure',
      name: 'pure',
      desc: '',
      args: [],
    );
  }

  /// `Dense`
  String get dense {
    return Intl.message(
      'Dense',
      name: 'dense',
      desc: '',
      args: [],
    );
  }

  /// `Umami`
  String get umami {
    return Intl.message(
      'Umami',
      name: 'umami',
      desc: '',
      args: [],
    );
  }

  /// `Natural`
  String get natural {
    return Intl.message(
      'Natural',
      name: 'natural',
      desc: '',
      args: [],
    );
  }

  /// `Creamy`
  String get creamy {
    return Intl.message(
      'Creamy',
      name: 'creamy',
      desc: '',
      args: [],
    );
  }

  /// `Acidulous`
  String get acidulous {
    return Intl.message(
      'Acidulous',
      name: 'acidulous',
      desc: '',
      args: [],
    );
  }

  /// `Black rice`
  String get black_rice {
    return Intl.message(
      'Black rice',
      name: 'black_rice',
      desc: '',
      args: [],
    );
  }

  /// `Expressive`
  String get expressive {
    return Intl.message(
      'Expressive',
      name: 'expressive',
      desc: '',
      args: [],
    );
  }

  /// `Licorice`
  String get licorice {
    return Intl.message(
      'Licorice',
      name: 'licorice',
      desc: '',
      args: [],
    );
  }

  /// `Pineapple`
  String get pineapple {
    return Intl.message(
      'Pineapple',
      name: 'pineapple',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get apple {
    return Intl.message(
      'Apple',
      name: 'apple',
      desc: '',
      args: [],
    );
  }

  /// `Fresh nuts`
  String get fresh_nuts {
    return Intl.message(
      'Fresh nuts',
      name: 'fresh_nuts',
      desc: '',
      args: [],
    );
  }

  /// `Clove`
  String get clove {
    return Intl.message(
      'Clove',
      name: 'clove',
      desc: '',
      args: [],
    );
  }

  /// `Subtle`
  String get subtle {
    return Intl.message(
      'Subtle',
      name: 'subtle',
      desc: '',
      args: [],
    );
  }

  /// `Shaded`
  String get shaded {
    return Intl.message(
      'Shaded',
      name: 'shaded',
      desc: '',
      args: [],
    );
  }

  /// `Lemon`
  String get lemon {
    return Intl.message(
      'Lemon',
      name: 'lemon',
      desc: '',
      args: [],
    );
  }

  /// `Citrus`
  String get citrus {
    return Intl.message(
      'Citrus',
      name: 'citrus',
      desc: '',
      args: [],
    );
  }

  /// `Refreshing`
  String get refreshing {
    return Intl.message(
      'Refreshing',
      name: 'refreshing',
      desc: '',
      args: [],
    );
  }

  /// `Restrained`
  String get restrained {
    return Intl.message(
      'Restrained',
      name: 'restrained',
      desc: '',
      args: [],
    );
  }

  /// `Clean`
  String get clean {
    return Intl.message(
      'Clean',
      name: 'clean',
      desc: '',
      args: [],
    );
  }

  /// `Fresh milk`
  String get fresh_milk {
    return Intl.message(
      'Fresh milk',
      name: 'fresh_milk',
      desc: '',
      args: [],
    );
  }

  /// `Herbs`
  String get herbs {
    return Intl.message(
      'Herbs',
      name: 'herbs',
      desc: '',
      args: [],
    );
  }

  /// `White flowers`
  String get white_flowers {
    return Intl.message(
      'White flowers',
      name: 'white_flowers',
      desc: '',
      args: [],
    );
  }

  /// `Bubblegum`
  String get bubblegum {
    return Intl.message(
      'Bubblegum',
      name: 'bubblegum',
      desc: '',
      args: [],
    );
  }

  /// `Lychee`
  String get lychee {
    return Intl.message(
      'Lychee',
      name: 'lychee',
      desc: '',
      args: [],
    );
  }

  /// `Ripe banana`
  String get ripe_banana {
    return Intl.message(
      'Ripe banana',
      name: 'ripe_banana',
      desc: '',
      args: [],
    );
  }

  /// `Salty`
  String get salty {
    return Intl.message(
      'Salty',
      name: 'salty',
      desc: '',
      args: [],
    );
  }

  /// `Fatty`
  String get fatty {
    return Intl.message(
      'Fatty',
      name: 'fatty',
      desc: '',
      args: [],
    );
  }

  /// `Rancid`
  String get rancid {
    return Intl.message(
      'Rancid',
      name: 'rancid',
      desc: '',
      args: [],
    );
  }

  /// `Rubber`
  String get rubber {
    return Intl.message(
      'Rubber',
      name: 'rubber',
      desc: '',
      args: [],
    );
  }

  /// `Plastic`
  String get plastic {
    return Intl.message(
      'Plastic',
      name: 'plastic',
      desc: '',
      args: [],
    );
  }

  /// `Solvent`
  String get solvent {
    return Intl.message(
      'Solvent',
      name: 'solvent',
      desc: '',
      args: [],
    );
  }

  /// `Papery`
  String get papery {
    return Intl.message(
      'Papery',
      name: 'papery',
      desc: '',
      args: [],
    );
  }

  /// `Dusty`
  String get dusty {
    return Intl.message(
      'Dusty',
      name: 'dusty',
      desc: '',
      args: [],
    );
  }

  /// `Musty`
  String get musty {
    return Intl.message(
      'Musty',
      name: 'musty',
      desc: '',
      args: [],
    );
  }

  /// `Fungal`
  String get fungal {
    return Intl.message(
      'Fungal',
      name: 'fungal',
      desc: '',
      args: [],
    );
  }

  /// `Burnt`
  String get burnt {
    return Intl.message(
      'Burnt',
      name: 'burnt',
      desc: '',
      args: [],
    );
  }

  /// `Smoky`
  String get smoky {
    return Intl.message(
      'Smoky',
      name: 'smoky',
      desc: '',
      args: [],
    );
  }

  /// `Meaty`
  String get meaty {
    return Intl.message(
      'Meaty',
      name: 'meaty',
      desc: '',
      args: [],
    );
  }

  /// `Roasted`
  String get roasted {
    return Intl.message(
      'Roasted',
      name: 'roasted',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Rice bran`
  String get rice_bran {
    return Intl.message(
      'Rice bran',
      name: 'rice_bran',
      desc: '',
      args: [],
    );
  }

  /// `Steamed rice`
  String get steamed_rice {
    return Intl.message(
      'Steamed rice',
      name: 'steamed_rice',
      desc: '',
      args: [],
    );
  }

  /// `Malt`
  String get malt {
    return Intl.message(
      'Malt',
      name: 'malt',
      desc: '',
      args: [],
    );
  }

  /// `Vanilla`
  String get vanilla {
    return Intl.message(
      'Vanilla',
      name: 'vanilla',
      desc: '',
      args: [],
    );
  }

  /// `Resinous`
  String get resinous {
    return Intl.message(
      'Resinous',
      name: 'resinous',
      desc: '',
      args: [],
    );
  }

  /// `Savoury`
  String get savoury {
    return Intl.message(
      'Savoury',
      name: 'savoury',
      desc: '',
      args: [],
    );
  }

  /// `Dried`
  String get dried {
    return Intl.message(
      'Dried',
      name: 'dried',
      desc: '',
      args: [],
    );
  }

  /// `Cinnamon`
  String get cinnamon {
    return Intl.message(
      'Cinnamon',
      name: 'cinnamon',
      desc: '',
      args: [],
    );
  }

  /// `Bitter`
  String get bitter {
    return Intl.message(
      'Bitter',
      name: 'bitter',
      desc: '',
      args: [],
    );
  }

  /// `Mint`
  String get mint {
    return Intl.message(
      'Mint',
      name: 'mint',
      desc: '',
      args: [],
    );
  }

  /// `Basil`
  String get basil {
    return Intl.message(
      'Basil',
      name: 'basil',
      desc: '',
      args: [],
    );
  }

  /// `Black tea`
  String get black_tea {
    return Intl.message(
      'Black tea',
      name: 'black_tea',
      desc: '',
      args: [],
    );
  }

  /// `Tobacco`
  String get tobacco {
    return Intl.message(
      'Tobacco',
      name: 'tobacco',
      desc: '',
      args: [],
    );
  }

  /// `Bay leaf`
  String get bay_leaf {
    return Intl.message(
      'Bay leaf',
      name: 'bay_leaf',
      desc: '',
      args: [],
    );
  }

  /// `Lemongrass`
  String get lemongrass {
    return Intl.message(
      'Lemongrass',
      name: 'lemongrass',
      desc: '',
      args: [],
    );
  }

  /// `Hay`
  String get hay {
    return Intl.message(
      'Hay',
      name: 'hay',
      desc: '',
      args: [],
    );
  }

  /// `Green leaves`
  String get green_leaves {
    return Intl.message(
      'Green leaves',
      name: 'green_leaves',
      desc: '',
      args: [],
    );
  }

  /// `Green tea`
  String get green_tea {
    return Intl.message(
      'Green tea',
      name: 'green_tea',
      desc: '',
      args: [],
    );
  }

  /// `Lily`
  String get lily {
    return Intl.message(
      'Lily',
      name: 'lily',
      desc: '',
      args: [],
    );
  }

  /// `Rose`
  String get rose {
    return Intl.message(
      'Rose',
      name: 'rose',
      desc: '',
      args: [],
    );
  }

  /// `Lilac`
  String get lilac {
    return Intl.message(
      'Lilac',
      name: 'lilac',
      desc: '',
      args: [],
    );
  }

  /// `Acacia`
  String get acacia {
    return Intl.message(
      'Acacia',
      name: 'acacia',
      desc: '',
      args: [],
    );
  }

  /// `Linden`
  String get linden {
    return Intl.message(
      'Linden',
      name: 'linden',
      desc: '',
      args: [],
    );
  }

  /// `Geranium`
  String get geranium {
    return Intl.message(
      'Geranium',
      name: 'geranium',
      desc: '',
      args: [],
    );
  }

  /// `Beeswax`
  String get beeswax {
    return Intl.message(
      'Beeswax',
      name: 'beeswax',
      desc: '',
      args: [],
    );
  }

  /// `Green apple`
  String get green_apple {
    return Intl.message(
      'Green apple',
      name: 'green_apple',
      desc: '',
      args: [],
    );
  }

  /// `Strawberry`
  String get strawberry {
    return Intl.message(
      'Strawberry',
      name: 'strawberry',
      desc: '',
      args: [],
    );
  }

  /// `Fig`
  String get fig {
    return Intl.message(
      'Fig',
      name: 'fig',
      desc: '',
      args: [],
    );
  }

  /// `Orange`
  String get orange {
    return Intl.message(
      'Orange',
      name: 'orange',
      desc: '',
      args: [],
    );
  }

  /// `Grapefruit`
  String get grapefruit {
    return Intl.message(
      'Grapefruit',
      name: 'grapefruit',
      desc: '',
      args: [],
    );
  }

  /// `Yuzu`
  String get yuzu {
    return Intl.message(
      'Yuzu',
      name: 'yuzu',
      desc: '',
      args: [],
    );
  }

  /// `Apricot`
  String get apricot {
    return Intl.message(
      'Apricot',
      name: 'apricot',
      desc: '',
      args: [],
    );
  }

  /// `Cherry`
  String get cherry {
    return Intl.message(
      'Cherry',
      name: 'cherry',
      desc: '',
      args: [],
    );
  }

  /// `Plum`
  String get plum {
    return Intl.message(
      'Plum',
      name: 'plum',
      desc: '',
      args: [],
    );
  }

  /// `Baked banana`
  String get baked_banana {
    return Intl.message(
      'Baked banana',
      name: 'baked_banana',
      desc: '',
      args: [],
    );
  }

  /// `Full`
  String get full {
    return Intl.message(
      'Full',
      name: 'full',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Desert`
  String get desert {
    return Intl.message(
      'Desert',
      name: 'desert',
      desc: '',
      args: [],
    );
  }

  /// `Metallic`
  String get metallic {
    return Intl.message(
      'Metallic',
      name: 'metallic',
      desc: '',
      args: [],
    );
  }

  /// `Foaming`
  String get foaming {
    return Intl.message(
      'Foaming',
      name: 'foaming',
      desc: '',
      args: [],
    );
  }

  /// `Tingling`
  String get tingling {
    return Intl.message(
      'Tingling',
      name: 'tingling',
      desc: '',
      args: [],
    );
  }

  /// `Aftertaste`
  String get aftertaste {
    return Intl.message(
      'Aftertaste',
      name: 'aftertaste',
      desc: '',
      args: [],
    );
  }

  /// `Mouth coating`
  String get mouth_coating {
    return Intl.message(
      'Mouth coating',
      name: 'mouth_coating',
      desc: '',
      args: [],
    );
  }

  /// `Smooth`
  String get smooth {
    return Intl.message(
      'Smooth',
      name: 'smooth',
      desc: '',
      args: [],
    );
  }

  /// `Velvety`
  String get velvety {
    return Intl.message(
      'Velvety',
      name: 'velvety',
      desc: '',
      args: [],
    );
  }

  /// `Homogeneous`
  String get homogeneous {
    return Intl.message(
      'Homogeneous',
      name: 'homogeneous',
      desc: '',
      args: [],
    );
  }

  /// `Lumpy`
  String get lumpy {
    return Intl.message(
      'Lumpy',
      name: 'lumpy',
      desc: '',
      args: [],
    );
  }

  /// `Grainy`
  String get grainy {
    return Intl.message(
      'Grainy',
      name: 'grainy',
      desc: '',
      args: [],
    );
  }

  /// `Sharp`
  String get sharp {
    return Intl.message(
      'Sharp',
      name: 'sharp',
      desc: '',
      args: [],
    );
  }

  /// `Alcoholic`
  String get alcoholic {
    return Intl.message(
      'Alcoholic',
      name: 'alcoholic',
      desc: '',
      args: [],
    );
  }

  /// `Yogurt`
  String get yogurt {
    return Intl.message(
      'Yogurt',
      name: 'yogurt',
      desc: '',
      args: [],
    );
  }

  /// `Mozzarella`
  String get mozzarella {
    return Intl.message(
      'Mozzarella',
      name: 'mozzarella',
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

  /// `The barre code is too short make sure to have the full barre code in front of the camera`
  String get error_barre_code_too_short {
    return Intl.message(
      'The barre code is too short make sure to have the full barre code in front of the camera',
      name: 'error_barre_code_too_short',
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