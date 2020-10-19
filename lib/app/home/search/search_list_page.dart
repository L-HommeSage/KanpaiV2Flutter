import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kanpai/app/home/models/country.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/sake_page.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/database.dart';
import 'package:kanpai/services/queries.dart';

class SearchListPage extends StatefulWidget {
  const SearchListPage(
      {@required this.title,
      @required this.query,
      @required this.queryType,
      this.database});
  final String title;
  final String query;
  final String queryType;
  final Database database;

  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  bool loading = false;
  bool querySuccess = false;
  List<Sake> sakes = [];

  @override
  void initState() {
    super.initState();
    Queries()
        .getSakesList(searchField: widget.queryType, query: widget.query)
        .then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        docs.documents.forEach((element) {
          Sake sake = Sake.fromMap(element.data, element.documentID);
          print(sake.id);
          sakes.add(sake);
        });
        loading = true;
        querySuccess = true;
      } else {
        loading = true;
        querySuccess = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: (loading)
          ? _buildBody()
          : Center(
              child: SpinKitFadingGrid(
                color: kAccentColor,
                size: 80,
              ),
            ),
    );
  }

  Widget _buildBody() {
    if (querySuccess) {
      return _buildListView();
    } else {
      return Center(
        child: Text(
          S.of(context).not_found,
          style: kHeadlinesTextStyle,
        ),
      );
    }
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: sakes.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) =>
                SakePage(database: widget.database, sake: sakes[index]),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Material(
            elevation: 4,
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
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: kHeadlinesTextStyle,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryTextColor,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
