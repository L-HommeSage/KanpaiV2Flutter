import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
            child: Icon(
              Icons.search,
              color: kAccentColor,
              size: 30,
            ),
          ),
          Text(
            S.of(context).search_sake,
            style: kCommonTextStyle,
          )
        ],
      ),
    );
  }
}
