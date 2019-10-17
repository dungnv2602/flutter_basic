import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  var _appBarWithTitle = AppBar(
    backgroundColor: Colors.red,
    title: Text('Title'),
    elevation: 4.0,
  );

  var _appBarWithListOfActions = AppBar(
    title: Text('Title'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {},
      ),
    ],
  );

  var _appBarWithTextAndIconTheme = AppBar(
    backgroundColor: Colors.blueAccent,
    title: Text('Title'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      )
    ],
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(title: TextStyle(color: Colors.white, fontSize: 20.0)),
  );

  var _appBarWithCenteredTitleAndSubtitle = AppBar(
    automaticallyImplyLeading: false,
    title: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Title',
            style: TextStyle(fontSize: 14.0),
          ),
          Text(
            'subtitle',
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    ),
  );

  var _appBarWithLogo = AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.yellow,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        FlutterLogo(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text('Title with image'),
        )
      ],
    ),
  );

  var _transparentAppBar = AppBar(
    backgroundColor: Colors.transparent,
    title: Text('Transparent AppBar'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _transparentAppBar,
    );
  }
}
