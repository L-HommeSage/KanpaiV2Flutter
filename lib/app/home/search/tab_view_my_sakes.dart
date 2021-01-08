import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kanpai/app/home/models/country.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/sake_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

class TabViewMySakes extends StatefulWidget {
  const TabViewMySakes({this.database, this.user});
  final Database database;
  final User user;
  @override
  _TabViewMySakesState createState() => _TabViewMySakesState();
}

class _TabViewMySakesState extends State<TabViewMySakes>
    with AutomaticKeepAliveClientMixin {
  List<Sake> sakes = [];
  bool loading = false;
  bool sakeExist = false;
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.user.sakeList.length; i++) {
      Firestore.instance
          .collection("sakes")
          .document(widget.user.sakeList[i])
          .get()
          .then((value) {
        Sake sake = Sake.fromMap(value.data, value.documentID);
        print(sake.name);
        sakes.add(sake);
        setState(() {
          loading = true;
          sakeExist = false;
        });
      });
    }
    if (sakes.length == 0) {
      setState(() {
        sakeExist = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return (!loading)
        ? Center(
            child: (!sakeExist)
                ? SpinKitFadingGrid(
                    color: kAccentColor,
                    size: 80,
                  )
                : Text(
                    S.of(context).not_found,
                    style: kHeadlinesTextStyle,
                  ),
          )
        : ListView.builder(
            itemCount: sakes.length,
            itemBuilder: (context, index) => _buildSakeTile(context, index),
          );
  }

  GestureDetector _buildSakeTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => SakePage(
            database: widget.database,
            sake: sakes[index],
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
                  tag: sakes[index].id,
                  child: Image.network(
                    sakes[index].photoUrl,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      sakes[index].name,
                      style: kHeadlinesTextStyle,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      sakes[index].family,
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
                          sakes[index].rating.toString(),
                          style: kCommonTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        ClipOval(
                          child: Flag(
                            Country().getCountryFlag(sakes[index].country),
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${sakes[index].region}, ${Country().getCountryName(sakes[index].country)}',
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

  @override
  bool get wantKeepAlive => true;
}
