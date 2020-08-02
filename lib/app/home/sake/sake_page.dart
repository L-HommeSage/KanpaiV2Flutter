import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/sake/detail_sliver_delegate_sake_header.dart';
import 'package:kanpai/app/home/sake/sake_inner_content.dart';
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
    _colorTween = ColorTween(begin: Colors.transparent, end: kDarkPrimaryColor)
        .animate(CurvedAnimation(
            parent: _colorAnimationController, curve: Curves.easeInBack));
    _iconColorTween = ColorTween(begin: kPrimaryColor, end: kPrimaryTextColor)
        .animate(_colorAnimationController);
    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _transTween = Tween(begin: Offset(-12, 50), end: Offset(-12, 0))
        .animate(_textAnimationController);

    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 250);

      _textAnimationController
          .animateTo((scrollInfo.metrics.pixels - 335) / 50);
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
                  child: _buildDetails(sake),
                )
              ],
            ),
            _buildSakeAppBar(sake),
          ],
        ),
      ),
    );
  }

  Container _buildSakeAppBar(Sake sake) {
    return Container(
      height: 80,
      child: AnimatedBuilder(
        animation: _colorAnimationController,
        builder: (context, child) => AppBar(
          backgroundColor: _colorTween.value,
          elevation: 0,
          title: Transform.translate(
              offset: _transTween.value,
              child: RichText(
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: sake.name,
                    style: kHeadlinesTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text: '\n${sake.family}',
                          style: TextStyle(
                              fontFamily: kFontFamilyCommonText,
                              fontSize: 14,
                              color: kSecondaryTextColor))
                    ]),
              )),
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
    );
  }

  Widget _buildSliverHead(Sake sake) {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(expandedHeight,
          "images/backgroundImage5.PNG", roundedContainerHeight, sake),
    );
  }

  Widget _buildWaitingPage() {
    //TODO: build waiting page like SliverHead to get smooth hero animation
    // think to pass the sake's name the sake image and its rating in the constructor
    return Center(
      child: Container(
        color: Colors.white,
      ),
    );
  }

  Widget _buildDetails(Sake sake) {
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
          child: SakeInnerContent(
            sake: sake,
            database: widget.database,
          ),
        ),
      ],
    );
  }
}
