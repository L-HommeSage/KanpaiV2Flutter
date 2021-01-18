import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/common_widgets/list_tile_sake_widget.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';
import 'package:kanpai/services/queries.dart';

class SearchListPage extends StatefulWidget {
  const SearchListPage(
      {@required this.title,
      @required this.query,
      @required this.queryType,
      @required this.database,
      @required this.user});
  final String title;
  final String query;
  final String queryType;
  final Database database;
  final User user;

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
        setState(() {
          loading = true;
          querySuccess = true;
        });
      } else {
        setState(() {
          loading = true;
          querySuccess = false;
        });
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
      itemBuilder: (context, index) => ListTileSake(
        widget: widget,
        sake: sakes[index],
        index: index,
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
