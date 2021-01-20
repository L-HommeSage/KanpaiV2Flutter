import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class Fermentation extends StatelessWidget {
  const Fermentation({
    @required this.context,
  });

  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
        fontSize: 20,
        color: kPrimaryTextColor,
        fontFamily: kFontFamilyHeadlines);
    const style2 = TextStyle(
        fontSize: 16,
        color: kPrimaryTextColor,
        fontFamily: kFontFamilyCommonText);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(S.of(context).fermentation_description, style: style),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                      color: Colors.lime,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Center(
                      child: Text(
                    "5% ${S.of(context).yeast_lactic_acid}",
                    style: TextStyle(
                        fontFamily: kFontFamilyCommonText,
                        color: kPrimaryTextColor),
                  )),
                ),
                Container(
                  height: 35,
                  color: Colors.blueGrey,
                  child: Center(
                      child: Text(
                    "15% ${S.of(context).kome_koji}",
                    style: TextStyle(
                        fontFamily: kFontFamilyCommonText, color: Colors.white),
                  )),
                ),
                Container(
                  height: 60,
                  color: Colors.white70,
                  child: Center(
                      child: Text(
                    "40%  ${S.of(context).rice}",
                    style: TextStyle(
                        fontFamily: kFontFamilyCommonText,
                        color: kPrimaryTextColor),
                  )),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Center(
                      child: Text(
                    "40%  ${S.of(context).water}",
                    style: TextStyle(
                        fontFamily: kFontFamilyCommonText, color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
          Text("- ${S.of(context).fermentation_day1}", style: style2),
          SizedBox(height: 10),
          Text("- ${S.of(context).fermentation_day2}", style: style2),
          SizedBox(height: 10),
          Text("- ${S.of(context).fermentation_day3}", style: style2),
          SizedBox(height: 10),
          Text("- ${S.of(context).fermentation_day4}", style: style2),
        ],
      ),
    );
  }
}
