import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class RowKanji extends StatelessWidget {
  const RowKanji({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Text(
                '技',
                style: kHeadlinesTextStyle,
              ),
              Text(
                "(Waza)",
                style: kCommonTextStyle,
              ),
              Text(
                S.of(context).skill,
                style: kCommonTextStyle,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Container(
          width: 2,
          height: 50,
          color: kAccentColor,
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Text(
                '水',
                style: kHeadlinesTextStyle,
              ),
              Text(
                "(Mizu)",
                style: kCommonTextStyle,
              ),
              Text(
                S.of(context).water,
                style: kCommonTextStyle,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Container(
          width: 2,
          height: 50,
          color: kAccentColor,
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Text(
                '米',
                style: kHeadlinesTextStyle,
              ),
              Text(
                "(Kome)",
                style: kCommonTextStyle,
              ),
              Text(
                S.of(context).rice,
                style: kCommonTextStyle,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
