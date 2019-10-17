import 'package:flutter/material.dart';

///A scrollable list that works page by page.
///Each child of a page view is forced to be the same size as the viewport. You can use a PageController to control which page is visible in the view. In addition to being able to control the pixel offset of the content inside the PageView, a PageController also lets you control the offset in terms of pages, which are increments of the viewport size. The PageController can also be used to control the PageController.initialPage, which determines which page is shown when the PageView is first constructed, and the PageController.viewportFraction, which determines the size of the pages as a fraction of the viewport size.

///This widget will help you create a scrollable list of pages on your screen. PageView widget takes a fixed list of children or you can customize it to change its child count on demand depending on change in the data source (network or database) with the help of PageView.builder. The orientation property of the PageView widget can be set to either vertical or horizontal depending on your use case. You can also provide this widget with a scroll physics for custom scroll behavior.

class PageViewSample extends StatefulWidget {
  @override
  _PageViewSampleState createState() => _PageViewSampleState();
}

class _PageViewSampleState extends State<PageViewSample> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  ///Page controller for the PageView
  final controller = PageController(initialPage: 0);

  var scrollDirection = Axis.horizontal;
  var actionIcon = Icons.swap_vert;

  Container genCardContainer(Color cardColor, String cardContent) {
    return Container(
      color: Colors.white,
      child: Card(
        color: cardColor,
        elevation: 4.0,
        margin: EdgeInsets.all(24),
        child: Center(
          child: Text(
            cardContent,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(
            'Page View Widget',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(actionIcon),
            onPressed: () {
              setState(() {
                scrollDirection == Axis.horizontal
                    ? scrollDirection = Axis.vertical
                    : scrollDirection = Axis.horizontal;
                actionIcon == Icons.swap_vert
                    ? actionIcon = Icons.swap_horiz
                    : actionIcon = Icons.swap_vert;
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content:
                        Text('Scroll direction changed to $scrollDirection')));
              });
              controller.position.applyViewportDimension(
                  scrollDirection == Axis.vertical
                      ? _screenSize.height
                      : _screenSize.width);
            },
          )
        ],
      ),

      ///using default constructor
      body: PageView(
        controller: controller,
        scrollDirection: scrollDirection,

        ///Enable physics property to provide your PageView with a
        ///custom scroll behaviour
        ///Here BouncingScrollPhysics will pull back the boundary
        ///item (first or last) if the user tries to scroll further.
        physics: BouncingScrollPhysics(),

        ///Page snapping allows us to keep the page at intermediate values.
        ///This is done by switching off the pageSnapping attribute.
        ///In this case the page will not scroll to an integer position and behave like a normal ListView.
        pageSnapping: true,
        children: <Widget>[
          genCardContainer(Colors.lightBlue, 'Card 1'),
          genCardContainer(Colors.purpleAccent, 'Card 2'),
          genCardContainer(Colors.pink, 'Card 3'),
        ],
      ),
    );
  }
}

class PageViewTransitionSample extends StatefulWidget {
  @override
  _PageViewTransitionSampleState createState() =>
      _PageViewTransitionSampleState();
}

class _PageViewTransitionSampleState extends State<PageViewTransitionSample> {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  Matrix4 _transform1(int position) {
    return Matrix4.identity()..rotateX(currentPageValue - position);
  }

  Matrix4 _transform2(int position) {
    return Matrix4.identity()
      ..rotateY(currentPageValue - position)
      ..rotateZ(currentPageValue - position);
  }

  Matrix4 _transform3(int position) {
    return Matrix4.identity()
      ..setEntry(3, 2, 0.004)
      ..rotateY(currentPageValue - position)
      ..rotateZ(currentPageValue - position);
  }

  Matrix4 _transform4(int position) {
    return Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(currentPageValue - position)
      ..rotateY(currentPageValue - position)
      ..rotateZ(currentPageValue - position);
  }

  Container _buildContainer(int position) {
    return Container(
      color: position % 2 == 0 ? Colors.blue : Colors.pink,
      child: Center(
        child: Text(
          "Page",
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemBuilder: (context, position) {
          ///currentPageValue.floor() gives us the page on the left and
          if (position == currentPageValue.floor()) {
            return Transform(
              transform: _transform4(position),
              child: _buildContainer(position),
            );

            ///currentPageValue.floor() + 1 gives us the page on the right
          } else if (position == currentPageValue.floor() + 1) {
            return Transform(
              transform: _transform4(position),
              child: _buildContainer(position),
            );
          } else {
            return _buildContainer(position);
          }
        },
        itemCount: 10,
      ),
    );
  }
}
