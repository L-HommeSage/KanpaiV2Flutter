import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:kanpai/app/home/models/review.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/review_page.dart';
import 'package:kanpai/app/home/sake/reviews_list_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReviewsPanel extends StatefulWidget {
  const ReviewsPanel({@required this.sake});
  final Sake sake;

  @override
  _ReviewsPanelState createState() => _ReviewsPanelState();
}

class _ReviewsPanelState extends State<ReviewsPanel> {
  int nbReviews = 0;
  List<Review> reviews = [];
  @override
  initState() {
    super.initState();
    loadReviews(widget.sake.id).then((var value) {
      reviews = value;
      print(reviews[0].username);
      setState(() {
        nbReviews = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(),
        SizedBox(height: 8),
        _buildTitle(context, S.of(context).reviews),
        SizedBox(height: 8),
        SizedBox(
            height: (nbReviews != 0) ? 220 : 80,
            child: (nbReviews != 0)
                ? _buildReviewsList(context)
                : _buildNoReviews(context)),
        (nbReviews == 0) ? SizedBox() : _buildAddReviewButton(context)
      ],
    );
  }

  ListView _buildReviewsList(BuildContext context) {
    int show = 0;
    if (nbReviews >= 5) {
      show = 4;
    } else {
      show = nbReviews;
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: show + 1,
      itemBuilder: (context, index) {
        return (index > show - 1)
            ? _buildReadMore(context, nbReviews - show)
            : GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => ReviewPage(
                      review: reviews[index],
                      sakeName: widget.sake.name + " " + widget.sake.family,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: kDarkPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 310,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, top: 8, bottom: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_circle,
                              size: 40,
                              color: kPrimaryTextColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                reviews[index].username,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                                style: kCommonTextStyle,
                              ),
                            )
                          ],
                        ),
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
                              itemSize: 15,
                              rating: reviews[index].rating,
                              itemCount: 5,
                              unratedColor: kDividerColor,
                              direction: Axis.horizontal,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(reviews[index].date)
                                .toString(),
                            style: TextStyle(
                                fontFamily: kFontFamilyCommonText,
                                color: kPrimaryTextColor),
                          )
                        ],
                      ),
                      Divider(),
                      Container(
                        height: 98,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            reviews[index].review,
                            maxLines: 5,
                            style: TextStyle(
                                color: kTextIconColor,
                                fontFamily: kFontFamilyCommonText,
                                fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            MdiIcons.thumbUpOutline,
                            size: 20,
                            color: kAccentColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              reviews[index].userLikes.length.toString(),
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
                              reviews[index].comments.length.toString(),
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
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }

  GestureDetector _buildReadMore(BuildContext context, int nbShow) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => ReviewsListPage(
            reviews: reviews,
            sakeName: widget.sake.name + " " + widget.sake.family,
          ),
        ),
      ),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("images/review.png")),
            color: kLightPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 310,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      kTextIconColor,
                      Color(0x8F202C39),
                      Color(0x0F202C39),
                      Color(0x00FFFFFF)
                    ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    nbShow.toString(),
                    style: TextStyle(
                        fontSize: 45,
                        color: kLightPrimaryColor,
                        fontFamily: kFontFamilyHeadlines),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Text(
                    "more reviews",
                    style: TextStyle(
                        fontFamily: kFontFamilyCommonText, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        "Read all reviews",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: kFontFamilyHeadlines,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.arrow_forward,
                        color: kPrimaryTextColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Container _buildNoReviews(BuildContext context) {
    return Container(
      height: 20,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).be_first,
              style: kCommonTextStyle,
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                print("okok");
              },
              icon: Icon(
                Icons.create,
                color: kPrimaryTextColor,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildAddReviewButton(BuildContext context) {
    return Container(
      height: 60,
      child: FlatButton(
        child: Center(
          child: Text(
            S.of(context).add_reviews,
            style: kCommonTextStyle,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Padding _buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        title,
        style: kHeadlinesTextStyle,
      ),
    );
  }
}

Future<dynamic> loadReviews(String sakeId) async {
  List<Review> reviews = [];
  QuerySnapshot querySnapshot = await Firestore.instance
      .collection("/sakes/" + sakeId + "/reviews/en/reviews")
      .getDocuments();
  final List docs = querySnapshot.documents;
  if (docs.isNotEmpty) {
    docs.forEach((element) {
      print(element.data);
      Review review = Review.fromMap(element.data, element.documentID);

      reviews.add(review);
    });
  }
  return reviews;
}
