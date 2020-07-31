import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/sake/temperature_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class TemperatureTile extends StatelessWidget {
  const TemperatureTile({@required this.temperature, @required this.leading});
  final String temperature;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: kPrimaryColor,
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
                        color: kPrimaryTextColor))
              ],
            ),
          ),
        );
      },
    );
  }
}
