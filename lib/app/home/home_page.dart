import 'package:flutter/material.dart';
import 'package:kanpai/app/home/hidden_drawer_menu.dart';
import 'package:kanpai/app/home/home_page_tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[HiddenDrawerMenu(), HomePageTabs()],
      ),
    );
  }
}
