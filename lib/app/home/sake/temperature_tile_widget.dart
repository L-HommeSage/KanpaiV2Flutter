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
    //TODO : faire les traductions avec intl
    switch (temperatureCode) {
      case 1:
        return 'Entre 5°C et 15°C';
      case 2:
        return 'Entre 15°C et 20°C';
      case 3:
        return 'Entre 20°C et 50°C';
      case 4:
        return 'Selon la saison froid en été ambiant en hiver ';
      case 5:
        return 'Selon la saison ambiant en été chaud en hiver';
      case 6:
        return 'Selon la saison froid en été chaud en hiver';
      case 7:
        return 'Faites vous plaisir';
      default:
        return '';
    }
  }
}
