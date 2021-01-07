import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:kanpai/app/home/models/review.dart';
import 'package:kanpai/app/home/sake/review_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

class ReviewListTile extends StatelessWidget {
  const ReviewListTile({
    @required this.review,
    @required this.sakeName,
  });

  final Review review;
  final String sakeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => ReviewPage(
              review: review,
              sakeName: sakeName,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: kDarkPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 50,
                    color: kPrimaryTextColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          review.username,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: kCommonTextStyle,
                        ),
                        Row(
                          children: <Widget>[
                            RatingBarIndicator(
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: kPrimaryTextColor,
                              ),
                              itemSize: 15,
                              rating: review.rating,
                              itemCount: 5,
                              unratedColor: kDividerColor,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 5),
                            Text(
                              DateFormat.yMMMd().format(review.date).toString(),
                              style: TextStyle(
                                  fontFamily: kFontFamilyCommonText,
                                  color: kPrimaryTextColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    MdiIcons.thumbUpOutline,
                    size: 20,
                    color: kAccentColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      review.userLikes.length.toString(),
                      style: TextStyle(
                          color: kAccentColor,
                          fontSize: 15,
                          fontFamily: kFontFamilyCommonText),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.message,
                    size: 20,
                    color: kAccentColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      review.comments.length.toString(),
                      style: TextStyle(
                          color: kAccentColor,
                          fontSize: 15,
                          fontFamily: kFontFamilyCommonText),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  review.review,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: kTextIconColor,
                      fontSize: 18,
                      fontFamily: kFontFamilyCommonText),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
