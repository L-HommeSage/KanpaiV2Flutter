import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/sake/rice_page.dart';
import 'package:kanpai/app/home/search/grid_types_widget.dart';
import 'package:kanpai/app/home/search/search_bar_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class TabBarSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSearchBar(),
        _buildBrowseTitle(context),
        buildTabGrids(),
      ],
    );
  }

  DefaultTabController buildTabGrids() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          TabBar(
            labelColor: kTextIconColor,
            indicatorColor: kAccentColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(text: 'Type'),
              Tab(text: 'Pairing'),
              Tab(text: 'Style'),
            ],
          ),
          SizedBox(
            height: 668,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                GridTypes(),
                GridTypes(),
                GridTypes(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: OpenContainer(
          closedBuilder: (context, openWidget) {
            return SearchBar();
          },
          openBuilder: (context, closeWidget) {
            return RicePage();
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
