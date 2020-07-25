import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          horizontalLine(),
          Text(
            S.of(context).or,
            style: kCommonTextStyle,
            textAlign: TextAlign.center,
          ),
          horizontalLine(),
        ],
      ),
    );
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 2,
          width: 100,
          color: Colors.black12,
        ),
      );
}
