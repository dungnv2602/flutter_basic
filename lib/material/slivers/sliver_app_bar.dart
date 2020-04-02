import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatefulWidget {
  @override
  _SliverAppBarWidgetState createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  ///The property snap can only be set to true if floating is also true.

  var _defaultAppBar = CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 150.0,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Available seats'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            tooltip: 'Add new entry',
            onPressed: () {/**/},
          ),
        ],
      )
    ],
  );

  var _floatingAppBar = CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        floating: true,
        expandedHeight: 150.0,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Available seats'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            tooltip: 'Add new entry',
            onPressed: () {/**/},
          ),
        ],
      )
    ],
  );

  var _pinnedAppBar = CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        expandedHeight: 150.0,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Available seats'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            tooltip: 'Add new entry',
            onPressed: () {/**/},
          ),
        ],
      )
    ],
  );

  static Widget createItem(Color color, String title) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black26, width: 1.0))),
      child: Center(
        child: Text(
          '$title',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black87, fontSize: 14.0, fontFamily: 'Roboto'),
        ),
      ),
    );
  }

  var _appBarWithList = CustomScrollView(slivers: <Widget>[
    ///First sliver is the App Bar
    SliverAppBar(
      elevation: 4.0,

      ///Properties of app bar
      ///
      /// Color of app bar when it is collapsed
      backgroundColor: Colors.blueAccent,

      /// Set to false so that appbar is always invisible after
      /// collapsing
      /// If set to true here, the app bar will expand as soon as you
      /// start scrolling up even if you haven't reached the top
      floating: false,

      /// To make the app bar visible at all times after collapsing
      /// we set pinned to true
      pinned: true,
      expandedHeight: 200.0,

      ///Properties of the App Bar when it is expanded
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "SliverAppBar Widget",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    ),

    ///Next sliver is the Sliver list that is used here to
    ///allow the user to scroll and observe the collapsing
    ///behaviour of SliverAppBar widget
    SliverFixedExtentList(
      itemExtent: 100.0,
      delegate: SliverChildListDelegate([
        createItem(Colors.white, 'item 1'),
        createItem(Colors.white, 'item 2'),
        createItem(Colors.white, 'item 3'),
        createItem(Colors.white, 'item 4'),
        createItem(Colors.white, 'item 5'),
        createItem(Colors.white, 'item 6'),
        createItem(Colors.white, 'item 7'),
        createItem(Colors.white, 'item 8'),
        createItem(Colors.white, 'item 9'),
        createItem(Colors.white, 'item 10'),
      ]),
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return _defaultAppBar;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String img1 =
      "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&h=350";
  String img2 =
      "https://images.pexels.com/photos/262438/pexels-photo-262438.jpeg?auto=compress&cs=tinysrgb&h=350";
  String img3 =
      "https://images.pexels.com/photos/865002/pexels-photo-865002.jpeg?auto=compress&cs=tinysrgb&h=350";
  String img4 =
      "https://images.pexels.com/photos/39397/dart-target-aim-arrow-39397.jpeg?auto=compress&cs=tinysrgb&h=350";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        reverse: true,
        slivers: <Widget>[
          MyAppBar(
            imgUrl: img1,
          ),
          MyAppBar(
            imgUrl: img2,
          ),
          MyAppBar(
            imgUrl: img3,
          ),
          MyAppBar(
            imgUrl: img4,
          ),
          SliverFillRemaining(
            child: Container(),
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final String imgUrl;
  const MyAppBar({
    Key key,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
        title: const Text('You must see this'),
        centerTitle: true,
      ),
    );
  }
}