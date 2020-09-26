import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';

class TabBarMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
