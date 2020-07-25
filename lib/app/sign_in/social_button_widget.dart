import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    @required this.color,
    @required this.textColor,
    @required this.onPressed,
    @required this.text,
    this.assetName,
    this.icon,
  });
  final Color color;
  final Color textColor;
  final Function onPressed;
  final String text;
  final String assetName;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    Widget imageOrIcon() {
      if (assetName == null)
        return icon;
      else
        return Image.asset(assetName);
    }

    return RaisedButton(
      color: color,
      disabledColor: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          imageOrIcon(),
          Text(
            text,
            style:
                TextStyle(fontFamily: "Lato", color: textColor, fontSize: 18),
          ),
          Opacity(
            opacity: 0,
            child: imageOrIcon(),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
