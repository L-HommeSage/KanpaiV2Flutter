import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:kanpai/app/home/models/review.dart';
import 'package:kanpai/constants/style.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    @required this.review,
    @required this.sakeName,
  });
  final Review review;
  final String sakeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(children: [
              TextSpan(
                text: review.username,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: kPrimaryTextColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            review.username,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontFamily: kFontFamilyCommonText,
                                color: kSecondaryTextColor,
                                fontSize: 25),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: RatingBarIndicator(
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: kPrimaryTextColor,
                            ),
                            itemSize: 25,
                            rating: review.rating,
                            itemCount: 5,
                            unratedColor: kDarkPrimaryColor,
                            direction: Axis.horizontal,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(review.date).toString(),
                          style: TextStyle(
                              fontFamily: kFontFamilyCommonText,
                              fontSize: 20,
                              color: kPrimaryTextColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                review.review,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22, color: kTextIconColor),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
