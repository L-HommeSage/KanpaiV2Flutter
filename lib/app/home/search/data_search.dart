import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';

class DataSearch extends SearchDelegate<String> {
  final sakesSearch = [
    "Paris",
    "London",
    "Seoul",
    "Tokyo",
    "New York",
    "Buenos Aires",
    "Beijing",
    "Brasilia",
    "Brest"
  ];
  final previousSearch = [
    "Paris",
    "London",
    "Seoul",
    "Tokyo",
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
      textTheme: theme.textTheme.copyWith(
        headline6: kCommonTextStyle,
      ),
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
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? previousSearch
        : sakesSearch.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              leading: (query.isEmpty)
                  ? Icon(Icons.restore, color: kSecondaryTextColor)
                  : Icon(Icons.search, color: kSecondaryTextColor),
              onTap: () {},
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
}
