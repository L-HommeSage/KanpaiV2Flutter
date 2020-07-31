import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/rice.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/rice_page.dart';
import 'package:kanpai/app/home/sake/temperature_tile_widget.dart';
import 'package:kanpai/common_widgets/image_icon_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class CharacteristicsPanel extends StatelessWidget {
  const CharacteristicsPanel({@required this.sake});
  final Sake sake;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '${S.current.characteristics}',
              style: kHeadlinesTextStyle,
            ),
          ),
          SizedBox(height: 5),
          _buildRiceTile(context),
          _buildTemperature(context),
        ],
      ),
    );
  }

  Widget _buildTemperature(context) {
    switch (sake.temperature) {
      case 1:
        return TemperatureTile(
          leading: IconImage(
            backgroundColor: Colors.blue,
            imagePath: 'icons/iconhiver.png',
            iconColor: kLightPrimaryColor,
          ),
          temperature: '${S.of(context).fresh}',
        );
      case 2:
        return TemperatureTile(
          leading: IconImage(
            backgroundColor: Colors.amber,
            imagePath: 'icons/iconwave.png',
            iconColor: kLightPrimaryColor,
          ),
          temperature: '${S.of(context).ambient}',
        );
      case 3:
        return TemperatureTile(
          leading: IconImage(
            backgroundColor: Colors.red,
            imagePath: 'icons/iconfeu.png',
            iconColor: kLightPrimaryColor,
          ),
          temperature: '${S.of(context).hot}',
        );
      case 4:
        return _buildDoubleIconsLeading(
            context,
            Colors.blue,
            'icons/iconhiver.png',
            Colors.amber,
            'icons/iconwave.png',
            '${S.of(context).fresh}, ${S.of(context).ambient}');
      case 5:
        return _buildDoubleIconsLeading(
            context,
            Colors.blue,
            'icons/iconhiver.png',
            Colors.red,
            'icons/iconfeu.png',
            '${S.of(context).fresh}, ${S.of(context).hot}');
      case 6:
        return _buildDoubleIconsLeading(
            context,
            Colors.amber,
            'icons/iconwave.png',
            Colors.red,
            'icons/iconfeu.png',
            '${S.of(context).ambient}, ${S.of(context).hot}');
      case 7:
        return _buildTripleIconsLeading(
            context,
            Colors.blue,
            'icons/iconhiver.png',
            Colors.amber,
            'icons/iconwave.png',
            Colors.red,
            'icons/iconfeu.png',
            '${S.of(context).fresh}, ${S.of(context).ambient}, ${S.of(context).hot}');
      default:
        return SizedBox();
    }
  }

  TemperatureTile _buildTripleIconsLeading(
      context,
      Color colorIcon1,
      String pathImage1,
      Color colorIcon2,
      String pathImage2,
      Color colorIcon3,
      String pathImage3,
      String description) {
    return TemperatureTile(
      leading: SizedBox(
        width: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 2, top: 8),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 11),
                  IconImage(
                    backgroundColor: colorIcon1,
                    imagePath: pathImage1,
                    iconColor: kLightPrimaryColor,
                    size: 20,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  IconImage(
                    backgroundColor: colorIcon3,
                    imagePath: pathImage3,
                    iconColor: kLightPrimaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 2),
                  IconImage(
                    backgroundColor: colorIcon2,
                    imagePath: pathImage2,
                    iconColor: kLightPrimaryColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      temperature: description,
    );
  }

  TemperatureTile _buildDoubleIconsLeading(
      context,
      Color colorIcon1,
      String pathImage1,
      Color colorIcon2,
      String pathImage2,
      String description) {
    return TemperatureTile(
      leading: SizedBox(
        width: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 2, top: 5),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconImage(
                    backgroundColor: colorIcon1,
                    imagePath: pathImage1,
                    iconColor: kLightPrimaryColor,
                    size: 25,
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  IconImage(
                    backgroundColor: colorIcon2,
                    imagePath: pathImage2,
                    iconColor: kLightPrimaryColor,
                    size: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      temperature: description,
    );
  }

  Widget _buildRiceTile(BuildContext context) {
    if (sake.rice == "" || sake.rice == null) {
      return SizedBox();
    } else {
      return OpenContainer(
        closedColor: kPrimaryColor,
        openBuilder: (context, action) {
          return RicePage();
        },
        closedBuilder: (context, action) {
          return ListTile(
            leading: Hero(
              tag: "riceTag",
              child: IconImage(
                imagePath: 'icons/riceIcon.png',
                backgroundColor: kPrimaryTextColor,
                iconColor: kLightPrimaryColor,
              ),
            ),
            title: RichText(
              text: TextSpan(
                text: '${S.current.rice}: ',
                style: kCommonTextStyle,
                children: [
                  TextSpan(
                      text: '${sake.rice}',
                      style: TextStyle(
                          fontFamily: kFontFamilyHeadlines,
                          fontSize: 18,
                          color: kPrimaryTextColor))
                ],
              ),
            ),
            subtitle: Text(
              Rice().getDescription(sake.rice),
              style: TextStyle(fontFamily: kFontFamilyCommonText),
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      );
    }
  }
}
