import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class ConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text(
      S.of(context).conditions,
      style: kHeadlinesTextStyle,
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: kPrimaryTextColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
