import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/search/search_list_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

class DataSearch extends SearchDelegate<String> {
  DataSearch({@required this.database, @required this.user});
  final User user;
  final Database database;
  final sakesSearch = [
    "Amabuki",
    "Tomoko",
    "Ryujin",
    "Oze No Yukidoke",
    "Sinsen",
    "Masuizumi",
    "Kirin",
    "Tatenokawa",
    "Amanoto",
    "Shirakabegura"
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: kPrimaryColor,
      primaryIconTheme:
          theme.primaryIconTheme.copyWith(color: kPrimaryTextColor),
      primaryColorBrightness: Brightness.dark,
      textTheme: theme.textTheme.copyWith(headline6: kCommonTextStyle),
      inputDecorationTheme:
          theme.inputDecorationTheme.copyWith(border: UnderlineInputBorder()),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => SearchListPage(
          title: _capitalize(query),
          query: _capitalize(query),
          queryType: "tagSearch",
          database: database,
          user: user,
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? user.previousSearch
        : sakesSearch
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              leading: (query.isEmpty)
                  ? Icon(Icons.restore, color: kSecondaryTextColor)
                  : Icon(Icons.search, color: kSecondaryTextColor),
              onTap: () {
                if (!user.previousSearch.contains(suggestionList[index])) {
                  user.previousSearch.add(suggestionList[index]);
                  Firestore.instance
                      .collection("users")
                      .document(user.uid)
                      .updateData({"previousSearch": user.previousSearch});
                }
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => SearchListPage(
                      title: suggestionList[index],
                      query: suggestionList[index],
                      queryType: "name",
                      database: database,
                      user: user,
                    ),
                  ),
                );
              },
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: kAccentColor,
                        fontFamily: kFontFamilyCommonText,
                        fontSize: 20),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: kCommonTextStyle)
                    ]),
              ),
            ));
  }

  String _capitalize(String string) {
    if (string == null) {
      throw ArgumentError.notNull('string');
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }
}
