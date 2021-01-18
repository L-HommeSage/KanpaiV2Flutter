import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/search/grid_pairings_widget.dart';
import 'package:kanpai/app/home/search/grid_styles_widget.dart';
import 'package:kanpai/app/home/search/grid_types_widget.dart';
import 'package:kanpai/app/home/search/search_bar_widget.dart';
import 'package:kanpai/app/home/search/search_text_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';
import 'package:provider/provider.dart';

class TabBarSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    final user = Provider.of<User>(context, listen: false);
    return ListView(
      children: <Widget>[
        _buildSearchBar(database, user),
        _buildBrowseTitle(context),
        buildTabGrids(database, user),
      ],
    );
  }

  DefaultTabController buildTabGrids(Database database, User user) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          TabBar(
            labelColor: kTextIconColor,
            indicatorColor: kAccentColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontFamily: kFontFamilyCommonText),
            tabs: <Widget>[
              Tab(text: S.current.type),
              Tab(text: S.current.pairing),
              Tab(text: S.current.style),
            ],
          ),
          SizedBox(
            height: 668,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                GridTypes(
                  database: database,
                  user: user,
                ),
                GridPairings(
                  database: database,
                  user: user,
                ),
                GridStyles(
                  database: database,
                  user: user,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildSearchBar(Database database, User user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: OpenContainer(
          closedBuilder: (context, openWidget) {
            return SearchBar();
          },
          openBuilder: (context, closeWidget) {
            return SearchTextPage(database: database, user: user);
          },
        ),
      ),
    );
  }

  Padding _buildBrowseTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Container(
          child: Text(
            S.of(context).browse_sake,
            style: kHeadlinesTextStyle,
          ),
        ),
      ),
    );
  }
}
