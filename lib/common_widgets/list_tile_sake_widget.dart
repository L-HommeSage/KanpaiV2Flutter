import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/country.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/sake_page.dart';
import 'package:kanpai/app/home/search/search_list_page.dart';
import 'package:kanpai/constants/style.dart';

class ListTileSake extends StatelessWidget {
  const ListTileSake({
    Key key,
    @required this.widget,
    @required this.sake,
    @required this.index,
  }) : super(key: key);

  final SearchListPage widget;
  final Sake sake;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => SakePage(
            database: widget.database,
            sake: sake,
            user: widget.user,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          color: index % 2 == 0 ? kDarkPrimaryColor : kLightPrimaryColor,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 8, bottom: 8, right: 20),
                child: Hero(
                  tag: sake.id,
                  child: CachedNetworkImage(
                    imageUrl: sake.photoUrl,
                    width: 60,
                    height: 150,
                    placeholder: (context, url) => CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: kAccentColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      child: Text(
                        sake.name,
                        style: kHeadlinesTextStyle,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                    Text(
                      sake.family,
                      style: kCommonTextStyle,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 20,
                          color: kPrimaryTextColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          sake.rating.toString(),
                          style: kCommonTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        ClipOval(
                          child: Flag(
                            Country().getCountryFlag(sake.country),
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${sake.region}, ${Country().getCountryName(sake.country)}',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: kFontFamilyCommonText,
                              color: kSecondaryTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
