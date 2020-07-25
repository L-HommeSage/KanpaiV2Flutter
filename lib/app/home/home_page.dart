import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kanpai/common_widgets/floating_scan_button_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              leading: IconButton(
                icon: Icon(
                  MdiIcons.menu,
                  color: kPrimaryTextColor,
                ),
                onPressed: () {},
              ),
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
                  Center(child: Container(child: Text("ok1"))),
                  Center(child: Container(child: Text("ok2"))),
                  Center(child: Container(child: Text("ok3"))),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingScanButton(),
      ),
    );
  }
}

/*
Scaffold(
appBar: AppBar(
title: Text('Home page'),
actions: <Widget>[
FlatButton(
onPressed: () => _confirmSignOut(context),
child: Text(
"Logout",
style: kHeadlinesTextStyle,
),
)
],
),
);

Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOUt = await PlatformAlertDialog(
      title: S.of(context).logout,
      content: S.of(context).logout_confirm,
      defaultActionText: S.of(context).confirm,
      cancelActionText: S.of(context).cancel,
    ).show(context);

    if (didRequestSignOUt == true) {
      _signOut(context);
    }
    Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
  }*/
