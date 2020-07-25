import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({@required this.onPressed, @required this.text});
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFf9b16e), kAccentColor],
            )),
        child: MaterialButton(
          height: 40,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          disabledColor: kDarkPrimaryColor,
          shape: StadiumBorder(),
          child: Text(
            text,
            style: TextStyle(
                color: kLightPrimaryColor, fontFamily: "Lato", fontSize: 20),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
