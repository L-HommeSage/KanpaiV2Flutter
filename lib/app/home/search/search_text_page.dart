import 'package:flutter/material.dart';
import 'package:kanpai/app/home/search/data_search.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class SearchTextPage extends StatefulWidget {
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
                showSearch(context: context, delegate: DataSearch());
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
    );
  }
}
