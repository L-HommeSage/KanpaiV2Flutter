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
          : NetworkImage(
              "https://lh3.googleusercontent.com/proxy/2diqz8HNf2eyqEL4VE7ll7HzyuGyIqf3MptnKfaHdB_yDYerAZD3_S8juqlaQd14_MzpluSwDZ0x19rKw3zjwSFCc-ogexILujdwbwO3Jy9uqu3AAROaxOA_s6PTMnfdvg3W9dO8-q-VCE4fDSqLISRXMO8"),
      //child: photoUrl == null ? Icon(Icons.camera_alt,size: radius):null,
    );
  }
}
