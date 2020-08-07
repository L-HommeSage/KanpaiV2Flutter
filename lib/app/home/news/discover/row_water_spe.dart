import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class RowWaterSpe extends StatelessWidget {
  const RowWaterSpe({
    @required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "${S.of(context).hard_water}:",
                  style: TextStyle(
                      color: kPrimaryTextColor,
                      fontFamily: kFontFamilyHeadlines,
                      fontSize: 20),
                ),
                SizedBox(height: 4),
                Text(
                  '${S.of(context).hard_water_description}',
                  style: kCommonTextStyle,
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.arrow_downward,
                  color: kAccentColor,
                ),
                Text(
                  '${S.of(context).hard_water_result}',
                  style: kCommonTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "${S.of(context).pure_water}:",
                  style: TextStyle(
                      color: kPrimaryTextColor,
                      fontFamily: kFontFamilyHeadlines,
                      fontSize: 20),
                ),
                SizedBox(height: 4),
                Text(
                  '${S.of(context).pure_water_description}',
                  style: kCommonTextStyle,
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.arrow_downward,
                  color: kAccentColor,
                ),
                Text(
                  '${S.of(context).pure_water_result}',
                  style: kCommonTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
