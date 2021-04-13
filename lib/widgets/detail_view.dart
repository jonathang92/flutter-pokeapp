import 'package:flutter/material.dart';
import 'package:pokeapp/widgets/TypePokemon.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final Map typeMap;
  final Color color;
  final Color color2;
  final Widget child;
  final String urlImage;
  final String heroTag;
  final String assetType;

  const DetailView({
    @required this.typeMap,
    @required this.color,
    @required this.color2,
    @required this.child,
    @required this.urlImage,
    @required this.heroTag,
    this.assetType,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new DetailPageModel(),
      child: Scaffold(
        body: Builder(builder: (BuildContext context) {
          final screenSize = MediaQuery.of(context).size;
          final scrollPage = Provider.of<DetailPageModel>(context).scrollOffset;
          final double cardSize =
              screenSize.height * 0.70 + (120 * scrollPage * 0.01);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _Background(color, color2),
              _TitleHeader(screenSize, scrollPage),
              _MainContent(cardSize, color, color2, content: child),
              _FloatImage(cardSize, scrollPage, heroTag, urlImage, assetType),
            ],
          );
        }),
      ),
    );
  }
}

class _MainContent extends StatefulWidget {
  final double cardSize;
  final Color color;
  final Color color2;
  final Widget content;

  const _MainContent(this.cardSize, this.color, this.color2,
      {@required this.content});

  @override
  __MainContentState createState() => __MainContentState();
}

class __MainContentState extends State<_MainContent> {
  @override
  void initState() {
    super.initState();
    final scrollController =
        Provider.of<DetailPageModel>(context, listen: false);
    scrollController.controller.addListener(() {
      Provider.of<DetailPageModel>(context, listen: false).scrollOffset =
          scrollController.controller.offset;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageSC =
        Provider.of<DetailPageModel>(context, listen: false).controller;
    return Container(
      // height: 500,
      width: double.infinity,
      height: widget.cardSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Scrollbar(
            child: SingleChildScrollView(
          controller: pageSC,
          physics: ClampingScrollPhysics(),
          child: widget.content,
        )),
      ),
    );
  }
}

class _TitleHeader extends StatelessWidget {
  final Size screenSize;
  final double scrollPage;
  const _TitleHeader(
    this.screenSize,
    this.scrollPage,
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Container(
        width: screenSize.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(10),
                child: FaIcon(
                  FontAwesomeIcons.chevronDown,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Center(
              child: Opacity(
                opacity: scrollPage * 0.01,
                child: Text(
                  'Bulbasaur',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background(
    this.color,
    this.color2,
  );

  final Color color;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
        colors: [
          color,
          color2,
        ],
      )),
    );
  }
}

class _FloatImage extends StatelessWidget {
  const _FloatImage(
    this.cardSize,
    this.scrollPage,
    this.heroTag,
    this.urlImage,
    this.assetType,
  );

  final double cardSize;
  final double scrollPage;
  final String heroTag;
  final String urlImage;
  final String assetType;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: cardSize - 50,
      child: Opacity(
        opacity: 1 - scrollPage * 0.01,
        child: Container(
          width: 200,
          child: Hero(
            tag: heroTag,
            child: (urlImage != '')
                ? Image.network(
                    urlImage,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  )
                : TypePokemon(
                    type: assetType,
                    width: 70,
                    padding: 30,
                  ),
          ),
        ),
      ),
    );
  }
}

class DetailPageModel with ChangeNotifier {
  ScrollController _pageScrollController = new ScrollController();
  double _scrollOffset = 0.0;
  ScrollController get controller => this._pageScrollController;

  set animatedScrollOffset(double offset) {
    this._pageScrollController.animateTo(offset,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    notifyListeners();
  }

  set scrollOffset(double offset) {
    this._scrollOffset = (offset > 100) ? 100 : offset;
    notifyListeners();
  }

  double get scrollOffset => this._scrollOffset;
}
