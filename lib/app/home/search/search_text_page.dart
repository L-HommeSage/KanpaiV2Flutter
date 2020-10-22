import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/search/data_search.dart';
import 'package:kanpai/app/home/search/tab_view_all.dart';
import 'package:kanpai/app/home/search/tab_view_my_sakes.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

class SearchTextPage extends StatefulWidget {
  const SearchTextPage({@required this.database, @required this.user});
  final Database database;
  final User user;

  @override
  _SearchTextPageState createState() => _SearchTextPageState();
}

class _SearchTextPageState extends State<SearchTextPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _myTabs = <Tab>[
    Tab(text: S.current.all),
    Tab(text: S.current.my_sakes),
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _myTabs.length,
    );
    _tabController.index = 0;
    Firestore.instance
        .collection("users")
        .document(widget.user.uid)
        .get()
        .then((value) {
      widget.user.previousSearch = value.data["previousSearch"];
      widget.user.sakeList = value.data["sakeList"];
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).search_sake,
          style: kHeadlinesTextStyle,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: kPrimaryTextColor,
              ),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: DataSearch(
                        user: widget.user, database: widget.database));
              }),
        ],
        bottom: TabBar(
          unselectedLabelColor: kTextIconColor,
          labelColor: kPrimaryTextColor,
          indicatorColor: kPrimaryTextColor,
          indicatorWeight: 2,
          controller: _tabController,
          tabs: _myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TabViewAll(
            database: widget.database,
          ),
          TabViewMySakes(
            database: widget.database,
            user: widget.user,
          ),
        ],
      ),
    );
  }
}
