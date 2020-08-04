import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';

class FlavorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flavor Page',
          style: kHeadlinesTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryTextColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
