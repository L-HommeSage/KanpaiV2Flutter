import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class KojiDescriptionPanel extends StatelessWidget {
  const KojiDescriptionPanel({
    @required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          _buildContainerInfo(
            context,
            S.of(context).koji_kin,
            S.of(context).koji_kin_description,
            "images/koji.png",
          ),
          Icon(
            Icons.add,
            color: kAccentColor,
            size: 30,
          ),
          _buildContainerInfo(
            context,
            S.of(context).koji_mai,
            S.of(context).koji_mai_description,
            "images/kojimai.png",
          ),
          Icon(
            Icons.arrow_forward,
            color: kAccentColor,
            size: 30,
          ),
          _buildContainerInfo(
            context,
            S.of(context).kome_koji,
            S.of(context).kome_koji_description,
            "images/komekoji.png",
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  Padding _buildContainerInfo(
      BuildContext context, String title, String text, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: kDarkPrimaryColor,
          ),
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 90,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kTextIconColor,
                    fontFamily: kFontFamilyHeadlines,
                    fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kSecondaryTextColor,
                      fontFamily: kFontFamilyCommonText,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
