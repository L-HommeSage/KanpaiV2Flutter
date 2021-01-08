import 'package:flutter/material.dart';
import 'package:kanpai/app/home/search/search_list_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

class TabViewAll extends StatelessWidget {
  const TabViewAll({@required this.database, @required this.user});
  final Database database;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Text(
            S.of(context).commonly_search + " :",
            style: kCommonTextStyle,
          ),
        ),
        _buildCommonlySearchTile("Amabuki", "name", database, user, context),
        Container(height: 1, color: kPrimaryColor),
        _buildCommonlySearchTile(
            "Shirakabegura", "name", database, user, context),
        Container(height: 1, color: kPrimaryColor),
        _buildCommonlySearchTile("Japan", "country", database, user, context),
      ],
    );
  }

  Container _buildCommonlySearchTile(
    String text,
    String queryType,
    Database database,
    User user,
    BuildContext context,
  ) {
    return Container(
      color: kLightPrimaryColor,
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => SearchListPage(
              title: text,
              query: text,
              queryType: queryType,
              database: database,
              user: user,
            ),
          ),
        ),
        title: Text(
          text,
          style: TextStyle(
              fontFamily: kFontFamilyCommonText,
              fontSize: 18,
              color: kPrimaryTextColor),
        ),
        leading: Icon(
          Icons.search,
          color: kPrimaryTextColor,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: kAccentColor,
        ),
      ),
    );
  }
}
