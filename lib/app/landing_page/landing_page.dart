import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kanpai/app/home/home_page.dart';
import 'package:kanpai/app/sign_in/intro_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return IntroPage.create(context);
          } else {
            Firestore.instance
                .collection("users")
                .document(user.uid)
                .get()
                .then((value) {
              user.previousSearch = value.data["previousSearch"];
              user.registered = value.data["registered"];
              user.sakeList = value.data["sakeList"];
              user.bookmarks = value.data["bookmarks"];
              user.myReviews = value.data["myReviews"];
              user.recommendedSearch = value.data["recommendedSearch"];
            });
          }

          return Provider<User>.value(
            value: user,
            child: Provider<Database>(
              create: (_) => FireStoreDatabase(uid: user.uid),
              child: HomePage(),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: SpinKitFadingGrid(
                color: kAccentColor,
                size: 80,
              ),
            ),
          );
        }
      },
    );
  }
}
