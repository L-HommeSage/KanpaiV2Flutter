import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/route_generator.dart';
import 'package:kanpai/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
        title: 'Kanpai',
        theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: '/',
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}

// Comment changer de langue

//MaterialButton(
//onPressed: () {
//setState(() {
//S.load(Locale("fr", "FR"));
//});
//},
//child: Text("Change to French"),
//),

// scanner button

//floatingActionButton: FloatingActionButton(
//onPressed: () {
////Navigator.of(context).pushNamed('/second');
////},
//tooltip: 'Increment',
//backgroundColor: kTertiaryColor,
//child: Icon(
//MdiIcons.barcodeScan,
//size: 30,
//color: kPrimaryColor,
//),
//),
