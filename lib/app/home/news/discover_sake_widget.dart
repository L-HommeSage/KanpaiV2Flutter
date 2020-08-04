import 'package:flutter/material.dart';
import 'package:kanpai/app/home/news/discover/discover_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class Discover extends StatelessWidget {
  const Discover({
    @required this.backgroundImage,
    @required this.colorGradient,
  });
  final String backgroundImage;
  final List<Color> colorGradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 1,
          color: kTextIconColor,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    height: 180,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: colorGradient)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 10,
                              child: Container(
                                child: Text(
                                  S.of(context).learn_more_about_sake,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: kLightPrimaryColor,
                                      fontSize: 25,
                                      fontFamily: kFontFamilyCommonText),
                                ),
                              ),
                            ),
                            Expanded(flex: 6, child: Container()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 100, left: 10),
                  child: Text(
                    S.of(context).sake_discover,
                    style: TextStyle(
                        color: kLightPrimaryColor,
                        fontSize: 18,
                        fontFamily: kFontFamilyCommonText),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                      flex: 1,
                      child: FlatButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              S.of(context).discover,
                              style: TextStyle(
                                  color: kLightPrimaryColor,
                                  fontFamily: kFontFamilyCommonText),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward,
                              color: kAccentColor,
                            )
                          ],
                        ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => DiscoverPage(),
                          ),
                        ),
                      )),
                ])
              ],
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: 5,
          child: Image.asset(
            'images/sakerice-min.png',
            height: 150,
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
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 5, size.height, size.width / 1.5, size.height);
    path.quadraticBezierTo(
        size.width - (size.width / 5), size.height, size.width, 165);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
