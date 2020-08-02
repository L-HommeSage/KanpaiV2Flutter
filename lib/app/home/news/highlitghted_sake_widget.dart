import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kanpai/app/home/sake/sake_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/database.dart';
import 'package:provider/provider.dart';

class HighlightedSake extends StatelessWidget {
  const HighlightedSake(
      {@required this.backgroundImage,
      @required this.message,
      @required this.colorGradient,
      this.tag});
  final String backgroundImage;
  final String message;
  final List<Color> colorGradient;
  final String tag;

  @override
  Widget build(BuildContext context) {
    final Database database = Provider.of<Database>(context, listen: false);
    return InkWell(
      highlightColor: kTextIconColor,
      borderRadius: BorderRadius.circular(8),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => SakePage(database: database),
        ),
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: kDarkPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipPath(
                    clipper: ClippingClass(),
                    child: Container(
                      decoration: BoxDecoration(
                        //color: kPrimaryTextColor,
                        image: DecorationImage(
                            image: AssetImage(backgroundImage),
                            fit: BoxFit.cover),
                      ),
                      height: 160,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: colorGradient)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, right: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(flex: 6, child: Container()),
                              Expanded(
                                flex: 10,
                                child: Container(
                                  child: Text(
                                    message,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: kLightPrimaryColor,
                                        fontSize: 25,
                                        fontFamily: kFontFamilyCommonText),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              '3.8',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: kFontFamilyHeadlines,
                                  color: kPrimaryTextColor),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '206 ${S.of(context).ratings}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: kFontFamilyCommonText,
                                      color: kSecondaryTextColor),
                                ),
                                RatingBarIndicator(
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kPrimaryTextColor,
                                  ),
                                  itemSize: 20,
                                  rating: 3.8,
                                  itemCount: 5,
                                  unratedColor: kPrimaryColor,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Hero(
              tag: tag,
              child: Image.asset(
                "images/Amabuki_Kimoto.png",
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 15);
    path.quadraticBezierTo(
        size.width / 5, size.height, size.width / 3, size.height);
    path.quadraticBezierTo(
        size.width - (size.width / 5), size.height, size.width, 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
