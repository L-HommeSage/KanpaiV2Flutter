import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kanpai/app/home/models/review.dart';
import 'package:kanpai/common_widgets/platform_exeption_alert_dialog.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/database.dart';

class AddReviewSheet extends StatefulWidget {
  const AddReviewSheet(
      {@required this.database,
      @required this.username,
      @required this.sakeId,
      @required this.updateListReviews});
  final Database database;
  final String username;
  final String sakeId;
  final Function updateListReviews;

  @override
  _AddReviewSheetState createState() => _AddReviewSheetState();
}

class _AddReviewSheetState extends State<AddReviewSheet> {
  bool canSendReview;
  double rate;
  String feedback;
  String review;
  final TextEditingController _reviewTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    canSendReview = false;
    rate = -1;
    review = "";
    feedback = "";
  }

  @override
  void dispose() {
    _reviewTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RatingBar(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: kDarkPrimaryColor,
                    itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: kPrimaryTextColor,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rate = rating;
                        feedback = "";
                      });
                    },
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (feedback == "") ? S.of(context).free_review : feedback,
                  style: (feedback == "")
                      ? kCommonTextStyle
                      : TextStyle(
                          color: kAccentColor,
                          fontFamily: kFontFamilyCommonText,
                          fontSize: 18,
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: TextField(
                          autofocus: true,
                          controller: _reviewTextController,
                          onChanged: (text) {
                            setState(() {
                              review = text;
                            });
                          },
                          maxLines: 8,
                          minLines: 1,
                          maxLength: 512,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          cursorColor: kAccentColor,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(
                              color: kTextIconColor,
                              fontFamily: kFontFamilyCommonText,
                              fontSize: 18),
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    color: kAccentColor,
                    icon: Icon(Icons.send),
                    onPressed: (review != "") ? sendReview : null,
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendReview() async {
    Review newReview = Review(
        id: documentIdFromCurrentDate(),
        rating: rate,
        review: review,
        profilePictureURL: "",
        date: DateTime.now(),
        userLikes: {},
        comments: [],
        username: widget.username);
    if (rate != -1) {
      try {
        setState(() {
          review = ""; // <=== avoid several clicks
        });
        await widget.database
            .setReviewEn(review: newReview, sakeId: widget.sakeId);
        widget.updateListReviews(newReview);
        Navigator.of(context).pop();
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: S.of(context).errorPage,
          exception: e,
        ).show(context);
      }
    } else {
      setState(() {
        feedback = S.of(context).please_grade;
      });
    }
  }
}
