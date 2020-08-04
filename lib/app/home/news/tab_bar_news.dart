import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/event_news.dart';
import 'package:kanpai/app/home/models/sake_news.dart';
import 'package:kanpai/app/home/news/discover_sake_widget.dart';
import 'package:kanpai/app/home/news/highlighted_sake_widget.dart';
import 'package:kanpai/app/home/news/info_container_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/database.dart';
import 'package:provider/provider.dart';

class TabBarNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    final List<Widget> listItems = [
      _buildTodayTitle(context),
      _buildHighlightedSake(
          context: context,
          database: database,
          id: "2",
          lang: "en",
          backgroundImage: "images/backgroundImage7.PNG"),
      _buildTodayEvent(
          id: '1', lang: 'en', database: database, context: context),
      _buildHighlightedSake(
          context: context,
          database: database,
          id: "1",
          lang: "en",
          backgroundImage: "images/backgroundImage6.PNG"),
      Discover(
        backgroundImage: "images/backgroundImage7.PNG",
        colorGradient: _getColorGradient(4),
      ),
      SizedBox(height: 90)
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) => listItems[index]),
    );
  }

  Container _buildTodayTitle(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
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

  StreamBuilder<SakeNews> _buildHighlightedSake(
      {BuildContext context,
      Database database,
      String id,
      String lang,
      String backgroundImage}) {
    return StreamBuilder<SakeNews>(
      stream: database.sakeNewsStream(lang, id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final sakeNews = snapshot.data;
          return Column(
            children: <Widget>[
              HighlightedSake(
                  message: sakeNews.message,
                  sakeId: sakeNews.sakeId,
                  backgroundImage: backgroundImage,
                  colorGradient: _getColorGradient(sakeNews.colorCode)),
              SizedBox(height: 20)
            ],
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Some error occurred'));
        } else {
          return SizedBox();
        }
      },
    );
  }

  StreamBuilder<EventNews> _buildTodayEvent({
    BuildContext context,
    Database database,
    String id,
    String lang,
  }) {
    return StreamBuilder<EventNews>(
      stream: database.eventNewsStream(lang, id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final eventNews = snapshot.data;
          return Column(
            children: <Widget>[
              InfoContainer(
                  message: eventNews.message,
                  title: eventNews.title,
                  eventUrl: eventNews.eventUrl,
                  backgroundImage: eventNews.photoUrl,
                  colorGradient: _getColorGradient(eventNews.colorCode)),
              SizedBox(height: 20)
            ],
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Some error occurred'));
        } else {
          return SizedBox();
        }
      },
    );
  }

  List<Color> _getColorGradient(int colorCode) {
    switch (colorCode) {
      case 1:
        return [
          kAccentColor,
          Color(0xAFFF6D6D),
          Color(0x0FFF6D6D),
          Color(0x00FFFFFF)
        ];
      case 2:
        return [
          kPrimaryTextColor,
          Color(0xAF0D1F66),
          Color(0x0F0D1F66),
          Color(0x00FFFFFF)
        ];
      case 3:
        return [
          Color(0xFFfca311),
          Color(0xAFfca311),
          Color(0x0Ffca311),
          Color(0x00FFFFFF)
        ];
      case 4:
        return [
          Color(0xFF606c38),
          Color(0xAF606c38),
          Color(0x0F606c38),
          Color(0x00FFFFFF)
        ];
      case 5:
        return [
          Color(0xFF5f0f40),
          Color(0xAF5f0f40),
          Color(0x0F5f0f40),
          Color(0x00FFFFFF)
        ];
      default:
        return [
          kAccentColor,
          Color(0xAFFF6D6D),
          Color(0x0FFF6D6D),
          Color(0x00FFFFFF)
        ];
    }
  }
}
