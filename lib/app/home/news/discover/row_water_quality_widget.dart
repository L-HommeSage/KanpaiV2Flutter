import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class RowWaterQuality extends StatelessWidget {
  const RowWaterQuality({
    @required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${S.of(context).low_in}:", style: kCommonTextStyle),
                Text("- ${S.of(context).iron}", style: kCommonTextStyle),
                Text("- ${S.of(context).manganese}", style: kCommonTextStyle),
              ],
            )),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${S.of(context).rich_in}:", style: kCommonTextStyle),
                Text("- ${S.of(context).potassium}", style: kCommonTextStyle),
                Text("- ${S.of(context).magnesium}", style: kCommonTextStyle),
                Text("- ${S.of(context).phosphoric_acid}",
                    style: kCommonTextStyle),
              ],
            )),
      ],
    );
  }
}
