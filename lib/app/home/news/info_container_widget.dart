import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    //@required this.backgroundImage,
    // @required this.message,
    @required this.colorGradient,
  });
  //final String backgroundImage;
  //final String message;
  final List<Color> colorGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kDarkPrimaryColor),
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage('images/salon.png'), fit: BoxFit.cover),
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
                            "hello",
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
        ],
      ),
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
