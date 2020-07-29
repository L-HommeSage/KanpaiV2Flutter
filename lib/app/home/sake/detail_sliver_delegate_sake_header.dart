import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/constants/style.dart';

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  DetailSliverDelegate(this.expandedHeight, this.backgroundImage,
      this.roundedContainerHeight, this.sake);
  final double expandedHeight;
  final String backgroundImage;
  final double roundedContainerHeight;
  final Sake sake;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Image.asset(
          backgroundImage,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight + 20,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xA8FFF7F1), kDarkPrimaryColor]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - 220 - shrinkOffset,
          left: 30,
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    sake.name,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: kFontFamilyHeadlines,
                        color: kPrimaryTextColor),
                  ),
                  Text(
                    sake.house,
                    style: kCommonTextStyle,
                  )
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 3.2),
              Transform.translate(
                offset: Offset(0, -80),
                child: Image.asset(
                  "images/Amabuki_Kimoto.png",
                  height: 300,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
