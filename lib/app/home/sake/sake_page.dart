import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/detail_sliver_delegate_sake_header.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/services/database.dart';
import 'package:flutter/foundation.dart';

class SakePage extends StatefulWidget {
  const SakePage({@required this.database});
  final Database database;

  @override
  _SakePageState createState() => _SakePageState();
}

class _SakePageState extends State<SakePage> {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 110;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Sake>(
      stream: widget.database.sakeStream('3256223100226'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final sake = snapshot.data;
          return _buildSakeContent(sake, context);
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Some error occurred'));
        } else {
          return _buildWaitingPage();
        }
      },
    );
  }

  Widget _buildSakeContent(Sake sake, BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: kPrimaryTextColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          _buildSliverHead(sake),
          SliverToBoxAdapter(
            child: _buildDetails(),
          )
        ],
      ),
    );
  }

  Widget _buildSliverHead(Sake sake) {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(expandedHeight,
          "images/backgroundImage6.PNG", roundedContainerHeight, sake),
    );
  }

  Widget _buildWaitingPage() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildDetails() {
    return Stack(
      children: <Widget>[
        Container(
          color: kDarkPrimaryColor,
          height: 100,
        ),
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: Column(
            children: <Widget>[
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
              _buildLoremIpsum(),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildLoremIpsum() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Text(
        kLoremIpsum,
        style: kCommonTextStyle,
      ),
    );
  }
}
