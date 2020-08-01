import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/pairing.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class PairingsPanel extends StatelessWidget {
  const PairingsPanel({@required this.sake});
  final Sake sake;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(),
        SizedBox(height: 8),
        _buildTitle(context, S.of(context).food_parings),
        SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sake.pairings.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                          Pairing().getPairingImage(sake.pairings[index])),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            kTextIconColor,
                            Color(0x0F202C39),
                            Color(0x00FFFFFF)
                          ])),
                  child: Transform.translate(
                    offset: Offset(0, 85),
                    child: Text(
                      " ${Pairing().getPairingName(sake.pairings[index])}",
                      style: TextStyle(
                          fontFamily: kFontFamilyHeadlines,
                          fontSize: 20,
                          color: kLightPrimaryColor),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Padding _buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        title,
        style: kHeadlinesTextStyle,
      ),
    );
  }
}

/*Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.centerLeft,
end: Alignment.centerRight,
colors: [kTextIconColor, Color(0x00202C39)])),
child: Text(
" ${Pairing().getPairingName(sake.pairings[index])}",
style: TextStyle(
fontFamily: kFontFamilyHeadlines,
fontSize: 20,
color: kLightPrimaryColor),
),
),*/
