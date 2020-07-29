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

class _SakePageState extends State<SakePage> with TickerProviderStateMixin {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 110;

  AnimationController _colorAnimationController;
  AnimationController _textAnimationController;
  Animation _colorTween, _iconColorTween;
  Animation<Offset> _transTween;

  @override
  void initState() {
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: kPrimaryTextColor)
        .animate(_colorAnimationController);
    _iconColorTween = ColorTween(begin: kPrimaryTextColor, end: kPrimaryColor)
        .animate(_colorAnimationController);

    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_textAnimationController);

    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 300);

      _textAnimationController
          .animateTo((scrollInfo.metrics.pixels - 220) / 50);
      return true;
    } else {
      return false;
    }
  }

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
      backgroundColor: kDarkPrimaryColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                _buildSliverHead(sake),
                SliverToBoxAdapter(
                  child: _buildDetails(),
                )
              ],
            ),
            Container(
              height: 80,
              child: AnimatedBuilder(
                animation: _colorAnimationController,
                builder: (context, child) => AppBar(
                  backgroundColor: _colorTween.value,
                  elevation: 0,
                  titleSpacing: 0.0,
                  title: Transform.translate(
                    offset: _transTween.value,
                    child: Text(
                      sake.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  iconTheme: IconThemeData(
                    color: _iconColorTween.value,
                  ),
                ),
              ),
            ),
          ],
        ),
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
