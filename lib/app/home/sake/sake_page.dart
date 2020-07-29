import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
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
    ));
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
    return Column(
      children: <Widget>[
        Container(
          color: kTextIconColor,
          height: 1,
        ),
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

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  DetailSliverDelegate(this.expandedHeight, this.backgroundImage,
      this.roundedContainerHeight, this.sake);
  final double expandedHeight;
  final String backgroundImage;
  final double roundedContainerHeight;
  final Sake sake;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Image.asset(
          backgroundImage,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight + 20,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - 220 - shrinkOffset,
          left: 30,
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    sake.name,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: kFontFamilyHeadlines,
                        color: kPrimaryTextColor),
                  ),
                  Text(
                    sake.house,
                    style: kCommonTextStyle,
                  )
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 3.2),
              Transform.translate(
                offset: Offset(0, -80),
                child: Image.asset(
                  "images/Amabuki_Kimoto.png",
                  height: 300,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
