import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  DetailSliverDelegate(this.expandedHeight, this.roundedContainerHeight);
  final double expandedHeight;
  final double roundedContainerHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/backgroundSake.png',
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/kanjiSake.png',
              height: 200,
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
          ),
        ),
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
