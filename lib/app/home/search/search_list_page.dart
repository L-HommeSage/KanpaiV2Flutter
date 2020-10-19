import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';

class SearchListPage extends StatelessWidget {
  const SearchListPage({@required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView.builder(
        itemExtent: 200,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(5),
            color: index % 2 == 0 ? kDarkPrimaryColor : kLightPrimaryColor,
            child: Center(
              child: Text(index.toString()),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: kHeadlinesTextStyle,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryTextColor,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
