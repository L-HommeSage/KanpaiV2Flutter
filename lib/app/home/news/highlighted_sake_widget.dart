import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/sake_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';
import 'package:provider/provider.dart';

class HighlightedSake extends StatelessWidget {
  const HighlightedSake({
    @required this.backgroundImage,
    @required this.message,
    @required this.colorGradient,
    @required this.sakeId,
  });
  final String backgroundImage;
  final String message;
  final String sakeId;
  final List<Color> colorGradient;

  @override
  Widget build(BuildContext context) {
    final Database database = Provider.of<Database>(context, listen: false);
    final User user = Provider.of<User>(context, listen: false);
    return StreamBuilder<Sake>(
      stream: database.sakeStream(sakeId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final sake = snapshot.data;
          return _buildContent(sake, context, database, user);
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Some error occurred'));
        } else {
          return SizedBox();
        }
      },
    );
  }

  Stack _buildContent(
      Sake sake, BuildContext context, Database database, User user) {
    return Stack(
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 1,
          color: kDarkPrimaryColor,
          child: InkWell(
            highlightColor: Color(0xAF1d3557),
            borderRadius: BorderRadius.circular(8),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => SakePage(
                  database: database,
                  sake: sake,
                  user: user,
                ),
              ),
            ),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipPath(
                    clipper: ClippingClass(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(backgroundImage),
                            fit: BoxFit.cover),
                      ),
                      height: 160,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
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
                              sake.rating.toString(),
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
                                  '${sake.nbRatings.toString()} ${S.of(context).ratings}',
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
                                  rating: sake.rating,
                                  itemCount: 5,
                                  unratedColor: kPrimaryColor,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${sake.name}, ${sake.family}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: kFontFamilyHeadlines,
                              fontSize: 17,
                              color: kPrimaryTextColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Hero(
            tag: sake.id,
            child: Image.network(
              sake.photoUrl,
              height: 300,
            ),
          ),
        ),
      ],
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
