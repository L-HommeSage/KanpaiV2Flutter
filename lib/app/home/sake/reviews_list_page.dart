import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/review.dart';
import 'package:kanpai/app/home/sake/review_tile_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class ReviewsListPage extends StatelessWidget {
  const ReviewsListPage({this.reviews, this.sakeName});
  final List<Review> reviews;
  final String sakeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) => ReviewListTile(
          review: reviews[index],
          sakeName: sakeName,
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(children: [
            TextSpan(
              text: S.of(context).reviews,
              style: kHeadlinesTextStyle,
            ),
            TextSpan(text: "\n"),
            TextSpan(text: sakeName, style: kCommonTextStyle)
          ])),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryTextColor,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
