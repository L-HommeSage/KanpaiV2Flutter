import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/sake/temperature_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class TemperatureTile extends StatelessWidget {
  const TemperatureTile(
      {@required this.temperature,
      @required this.leading,
      @required this.temperatureCode});
  final String temperature;
  final Widget leading;
  final int temperatureCode;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: kPrimaryColor,
      closedElevation: 0,
      openBuilder: (context, action) {
        return TemperaturePage();
      },
      closedBuilder: (context, action) {
        return ListTile(
          leading: leading,
          dense: true,
          title: RichText(
            text: TextSpan(
              text: '${S.of(context).temperature}: ',
              style: kCommonTextStyle,
              children: [
                TextSpan(
                  text: temperature,
                  style: TextStyle(
                      fontFamily: kFontFamilyHeadlines,
                      fontSize: 18,
                      color: kPrimaryTextColor),
                ),
              ],
            ),
          ),
          subtitle: Text(
            _getSubtitle(),
            style: TextStyle(
                fontFamily: kFontFamilyCommonText, color: kSecondaryTextColor),
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }

  String _getSubtitle() {
    switch (temperatureCode) {
      case 1:
        return S.current.temperature_desc_1;
      case 2:
        return S.current.temperature_desc_2;
      case 3:
        return S.current.temperature_desc_3;
      case 4:
        return S.current.temperature_desc_4;
      case 5:
        return S.current.temperature_desc_5;
      case 6:
        return S.current.temperature_desc_6;
      case 7:
        return S.current.temperature_desc_7;
      default:
        return '';
    }
  }
}
