import 'package:flutter/material.dart';
import 'package:kanpai/app/home/news/discover/row_kanji_widget.dart';
import 'package:kanpai/app/home/news/discover/sliver_persistent_header.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;

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
    _transTween = Tween(begin: Offset(-12, 38), end: Offset(-12, 0))
        .animate(_textAnimationController);

    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 250);
      _textAnimationController
          .animateTo((scrollInfo.metrics.pixels - 325) / 50);
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                _buildSliverPersistentHeader(),
                SliverToBoxAdapter(
                  child: _buildDetails(),
                )
              ],
            ),
            _buildAnimatedAppBar(),
          ],
        ),
      ),
    );
  }

  SliverPersistentHeader _buildSliverPersistentHeader() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(expandedHeight, roundedContainerHeight),
    );
  }

  Widget _buildDetails() {
    return Column(
      children: <Widget>[
        Container(
          height: 2,
          color: kPrimaryTextColor,
        ),
        RowKanji(context: context),
        Container(
          height: 2,
          color: kPrimaryTextColor,
        ),
        _buildTitle(title: S.of(context).sake),
        Divider(),
        _buildCommonParagraph(
          text: S.of(context).sake_description_discover1,
        ),
        Divider(),
        _buildCommonParagraph(
          text: S.of(context).sake_discover,
        ),
        Divider(),
        _buildTitle(title: S.of(context).water),
      ],
    );
  }

  Padding _buildCommonParagraph({String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontSize: 20,
            color: kSecondaryTextColor,
            fontFamily: kFontFamilyCommonText),
      ),
    );
  }

  Padding _buildTitle({String title}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: kFontFamilyHeadlines,
            fontSize: 40,
            color: kPrimaryTextColor),
      ),
    );
  }

  Container _buildAnimatedAppBar() {
    return Container(
      height: 80,
      child: AnimatedBuilder(
        animation: _colorAnimationController,
        builder: (context, child) => AppBar(
          backgroundColor: _colorTween.value,
          elevation: 0,
          title: Transform.translate(
            offset: _transTween.value,
            child: Text(
              'Sake',
              style: kHeadlinesTextStyle,
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
    );
  }
}
