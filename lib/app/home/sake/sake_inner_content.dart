import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/constants/style.dart';

class SakeInnerContent extends StatelessWidget {
  const SakeInnerContent({@required this.sake});
  final Sake sake;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(sake.name, style: kHeadlinesTextStyle),
        )),
      ],
    );
  }
}
