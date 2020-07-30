import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

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
          top: expandedHeight - 215 - shrinkOffset,
          left: 30,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          sake.rating.toString(),
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: kFontFamilyHeadlines,
                              color: kPrimaryTextColor),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              sake.nbRatings.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: kFontFamilyCommonText,
                                  color: kSecondaryTextColor),
                            ),
                            Text(
                              S.of(context).ratings,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: kFontFamilyCommonText,
                                  color: kSecondaryTextColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RatingBarIndicator(
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: kPrimaryTextColor,
                      ),
                      itemSize: 25,
                      rating: sake.rating,
                      itemCount: 5,
                      unratedColor: kDividerColor,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 5),
              Transform.translate(
                offset: Offset(0, -90),
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
