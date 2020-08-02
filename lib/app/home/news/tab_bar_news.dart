import 'package:flutter/material.dart';
import 'package:kanpai/app/home/news/highlitghted_sake_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class TabBarNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      children: <Widget>[
        _buildTodayTitle(context),
        HighlightedSake(
          message: 'New Arrival',
          tag: '3256223100222',
          backgroundImage: "images/backgroundImage6.PNG",
          colorGradient: [
            kPrimaryTextColor,
            Color(0xAF0D1F66),
            Color(0x0F0D1F66),
            Color(0x00FFFFFF)
          ],
        ),
        SizedBox(height: 10),
        HighlightedSake(
          message: 'Hot this week',
          tag: '3256223100224',
          backgroundImage: "images/backgroundImage2.PNG",
          colorGradient: [
            kAccentColor,
            Color(0xAFFF6D6D),
            Color(0x0FFF6D6D),
            Color(0x00FFFFFF)
          ],
        ),
        SizedBox(height: 10),
        HighlightedSake(
          message: 'Recommended by our team',
          tag: '3256223100226',
          backgroundImage: "images/backgroundImage3.PNG",
          colorGradient: [
            Color(0xFFFABC3C),
            Color(0xAFFABC3C),
            Color(0x0FFACC6B),
            Color(0x00FFFFFF)
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }

  Container _buildTodayTitle(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${S.of(context).today_selection}:',
              style: kHeadlinesTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
