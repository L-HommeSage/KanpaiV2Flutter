import 'package:flutter/material.dart';
import 'package:kanpai/common_widgets/image_icon_widget.dart';
import 'package:kanpai/constants/style.dart';

class RicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rice Page',
          style: kHeadlinesTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryTextColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Hero(
          tag: 'riceTag',
          child: IconImage(
            imagePath: 'icons/riceIcon.png',
            backgroundColor: kPrimaryTextColor,
            iconColor: kLightPrimaryColor,
          ),
        ),
      ),
    );
  }
}
