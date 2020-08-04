import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    @required this.backgroundImage,
    @required this.message,
    @required this.title,
    this.eventUrl,
    @required this.colorGradient,
  });
  final String backgroundImage;
  final String message;
  final String title;
  final String eventUrl;
  final List<Color> colorGradient;

  @override
  Widget build(BuildContext context) {
    return Material(
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
                      image: NetworkImage(backgroundImage), fit: BoxFit.cover),
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
                              title,
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                message,
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
                flex: 3,
                child: Container(),
              ),
              Expanded(
                  flex: 2,
                  child: FlatButton(
                    child: Row(
                      children: <Widget>[
                        Text(
                          S.of(context).see_more,
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
                    onPressed: () => _launchUrlInApp(eventUrl),
                  )),
            ])
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrlInApp(String url) async {
  if (await canLaunch(url)) {
    await launch(url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'header_key': 'header_value'});
  } else {
    throw 'Could not launch $url';
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
