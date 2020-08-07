import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RiceTimeLiner extends StatelessWidget {
  const RiceTimeLiner({
    @required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TimelineTile(
              alignment: TimelineAlign.manual,
              lineX: 0.1,
              isFirst: true,
              indicatorStyle: const IndicatorStyle(
                width: 15,
                color: kAccentColor,
              ),
              topLineStyle: const LineStyle(
                color: kAccentColor,
                width: 4,
              ),
              rightChild: _buildRightChild(
                  image: "images/riceback.png",
                  title: S.of(context).harvest,
                  info: S.of(context).harvest_description)),
          const TimelineDivider(
            begin: 0.1,
            end: 0.9,
            thickness: 4,
            color: kAccentColor,
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineX: 0.9,
            topLineStyle: const LineStyle(
              color: kAccentColor,
              width: 4,
            ),
            bottomLineStyle: const LineStyle(
              color: kAccentColor,
              width: 4,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 15,
              color: kAccentColor,
            ),
            leftChild: _buildLeftChild(
                title: S.of(context).polishing,
                info: S.of(context).polishing_description,
                image: "images/polishedrice.png"),
          ),
          const TimelineDivider(
            begin: 0.1,
            end: 0.9,
            thickness: 4,
            color: kAccentColor,
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineX: 0.1,
            topLineStyle: const LineStyle(
              color: kAccentColor,
              width: 4,
            ),
            bottomLineStyle: const LineStyle(
              color: kAccentColor,
              width: 4,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 15,
              color: kAccentColor,
            ),
            rightChild: _buildRightChild(
                image: "images/lavage.png",
                title: S.of(context).washing,
                info: S.of(context).washing_description),
          ),
          const TimelineDivider(
            begin: 0.1,
            end: 0.9,
            thickness: 4,
            color: kAccentColor,
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineX: 0.9,
            topLineStyle: const LineStyle(
              color: kAccentColor,
              width: 4,
            ),
            bottomLineStyle: const LineStyle(
              color: kAccentColor,
              width: 4,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 15,
              color: kAccentColor,
            ),
            leftChild: _buildLeftChild(
                image: 'images/trempage.png',
                title: S.of(context).soaking,
                info: S.of(context).soaking_description),
          ),
          const TimelineDivider(
            begin: 0.1,
            end: 0.9,
            thickness: 4,
            color: kAccentColor,
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineX: 0.1,
            isLast: true,
            topLineStyle: const LineStyle(
              color: kAccentColor,
              width: 4,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 15,
              color: kAccentColor,
            ),
            rightChild: _buildRightChild(
                image: 'images/steaming.png',
                title: S.of(context).steam_cooking,
                info: S.of(context).soaking_description),
          ),
        ],
      ),
    );
  }

  Padding _buildRightChild({String title, String info, String image}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kTextIconColor,
                    Color(0x5F0D1F66),
                    Colors.transparent
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          color: kLightPrimaryColor,
                          fontSize: 20,
                          fontFamily: kFontFamilyHeadlines)),
                  Text(
                    info,
                    style: TextStyle(
                        color: kLightPrimaryColor,
                        fontSize: 15,
                        fontFamily: kFontFamilyCommonText),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildLeftChild({String title, String info, String image}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    kTextIconColor,
                    Color(0x5F0D1F66),
                    Colors.transparent
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          color: kLightPrimaryColor,
                          fontSize: 20,
                          fontFamily: kFontFamilyHeadlines)),
                  Text(
                    info,
                    style: TextStyle(
                        color: kLightPrimaryColor,
                        fontSize: 15,
                        fontFamily: kFontFamilyCommonText),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
