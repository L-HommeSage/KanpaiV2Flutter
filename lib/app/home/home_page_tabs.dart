import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/tab_bar_history.dart';
import 'package:kanpai/app/home/tab_bar_news.dart';
import 'package:kanpai/app/home/tab_bar_search.dart';
import 'package:kanpai/common_widgets/floating_scan_button_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePageTabs extends StatefulWidget {
  @override
  _HomePageTabsState createState() => _HomePageTabsState();
}

class _HomePageTabsState extends State<HomePageTabs> {
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;
  double _radius = 0;

  bool _toggleDrawer = false;

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
      child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: _buildHomePageInnerContent()),
    );
  }

  DefaultTabController _buildHomePageInnerContent() {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kDarkPrimaryColor,
              pinned: true,
              floating: true,
              leading: _buildIconDrawerButton(),
              flexibleSpace: FlexibleSpaceBar(),
              bottom: TabBar(
                unselectedLabelColor: kTextIconColor,
                labelColor: kPrimaryTextColor,
                indicatorColor: kPrimaryTextColor,
                indicatorWeight: 2,
                tabs: <Tab>[
                  Tab(icon: Icon(MdiIcons.storefront)),
                  Tab(icon: Icon(MdiIcons.foodVariant)),
                  Tab(icon: Icon(Icons.home)),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: <Widget>[
                  TabBarNews(),
                  TabBarSearch(),
                  TabBarHistory(),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingScanButton(),
      ),
    );
  }

  IconButton _buildIconDrawerButton() {
    return IconButton(
      icon: Icon(
        (_toggleDrawer) ? Icons.arrow_back_ios : Icons.menu,
        color: kPrimaryTextColor,
      ),
      onPressed: () {
        if (!_toggleDrawer) {
          setState(() {
            _xOffset = 230;
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
