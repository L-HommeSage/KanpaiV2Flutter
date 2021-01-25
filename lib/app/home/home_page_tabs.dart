import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:kanpai/app/home/maps/tab_bar_map.dart';
import 'package:kanpai/app/home/news/tab_bar_news.dart';
import 'package:kanpai/app/home/search/tab_bar_search.dart';
import 'package:kanpai/common_widgets/floating_scan_button_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePageTabs extends StatefulWidget {
  @override
  _HomePageTabsState createState() => _HomePageTabsState();
}

class _HomePageTabsState extends State<HomePageTabs>
    with SingleTickerProviderStateMixin {
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;
  double _radius = 0;
  bool _toggleDrawer = false;

  String _currentTitle = "";

  final List<Tab> _myTabs = <Tab>[
    Tab(icon: Icon(MdiIcons.storefront)),
    Tab(icon: Icon(MdiIcons.foodVariant)),
    // Tab(icon: Icon(MdiIcons.earth)),
  ];
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _myTabs.length,
    );
    _tabController.addListener(() {
      _setTitle(_tabController.index);
    });
    _scrollController = ScrollController();
    _tabController.index = 1;
    _setTitle(_tabController.index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kTextIconColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      duration: Duration(milliseconds: (_toggleDrawer) ? 1500 : 900),
      curve: (_toggleDrawer) ? Curves.elasticOut : Curves.easeOutExpo,
      transform: Matrix4.translationValues(_xOffset, _yOffset, 0)
        ..scale(_scaleFactor),
      child: GestureDetector(
        onTap: (!_toggleDrawer)
            ? () {}
            : () {
                setState(() {
                  _xOffset = 0;
                  _yOffset = 0;
                  _scaleFactor = 1;
                  _radius = 0;
                  _toggleDrawer = !_toggleDrawer;
                });
              },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(_radius),
            child: _buildHomePageInnerContent()),
      ),
    );
  }

  Scaffold _buildHomePageInnerContent() {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: kDarkPrimaryColor,
              pinned: true,
              forceElevated: boxIsScrolled,
              title: Text(_currentTitle, style: kHeadlinesTextStyle),
              //  floating: (_tabController.index == 1) ? false : true,
              floating: false,
              actions: <Widget>[
                _buildIconDrawerButton(),
              ],
              bottom: TabBar(
                unselectedLabelColor: kTextIconColor,
                labelColor: kPrimaryTextColor,
                labelStyle: TextStyle(fontFamily: kFontFamilyCommonText),
                indicatorColor: kPrimaryTextColor,
                indicatorWeight: 2,
                controller: _tabController,
                tabs: _myTabs,
                onTap: (index) {
                  _setTitle(index);
                },
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            TabBarNews(),
            TabBarSearch(),
            // TabBarMap(),
          ],
        ),
      ),
      floatingActionButton: FloatingScanButton(),
    );
  }

  void _setTitle(index) {
    if (index == 0) {
      setState(() => _currentTitle = S.current.news);
    } else if (index == 1) {
      setState(() => _currentTitle = S.current.search);
      //} else if (index == 2) {
      //   setState(() => _currentTitle = S.current.explore);
    } else {
      setState(() => _currentTitle = "");
    }
  }

  IconButton _buildIconDrawerButton() {
    return IconButton(
      icon: Icon(
        (_toggleDrawer) ? Icons.arrow_forward_ios : Icons.menu,
        color: kPrimaryTextColor,
      ),
      onPressed: () {
        if (!_toggleDrawer) {
          setState(() {
            _xOffset = -100;
            _yOffset = 120;
            _scaleFactor = 0.7;
            _radius = 25;
            _toggleDrawer = !_toggleDrawer;
          });
        } else {
          setState(() {
            _xOffset = 0;
            _yOffset = 0;
            _scaleFactor = 1;
            _radius = 0;
            _toggleDrawer = !_toggleDrawer;
          });
        }
      },
    );
  }
}
