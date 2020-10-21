import 'package:flutter/material.dart';
import 'package:kanpai/app/home/search/search_list_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/database.dart';

class TabViewAll extends StatelessWidget {
  const TabViewAll({this.database});
  final Database database;

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
        _buildCommonlySearchTile("Amabuki", database, context),
        Container(height: 1, color: kPrimaryColor),
        _buildCommonlySearchTile("Shirakabegura", database, context),
      ],
    );
  }

  Container _buildCommonlySearchTile(
    String text,
    Database database,
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
              queryType: "name",
              database: database,
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
