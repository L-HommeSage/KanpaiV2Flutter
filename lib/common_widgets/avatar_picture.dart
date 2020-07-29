import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:kanpai/constants/style.dart';

class Avatar extends StatelessWidget {
  const Avatar({this.photoUrl, @required this.radius});
  final String photoUrl;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kPrimaryColor,
      radius: radius,
      backgroundImage: photoUrl != null
          ? NetworkImage(photoUrl)
          : AssetImage("images/Portrait1.PNG"),
      //child: photoUrl == null ? Icon(Icons.camera_alt,size: radius):null,
    );
  }
}
