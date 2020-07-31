import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  const IconImage(
      {@required this.iconColor,
      @required this.imagePath,
      @required this.backgroundColor,
      this.size = 45});
  final Color iconColor;
  final Color backgroundColor;
  final String imagePath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: size,
        width: size,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            height: (size == 45) ? 25 : 20,
            width: (size == 45) ? 25 : 20,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
