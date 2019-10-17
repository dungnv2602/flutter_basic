import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  var _content = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.red,
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            labelStyle: TextStyle(fontSize: 20),
            unselectedLabelColor: Colors.white,
            unselectedLabelStyle: TextStyle(fontSize: 14),
            indicatorColor: Colors.blueAccent,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
//            indicator: ShapeDecoration(
//              shape: BeveledRectangleBorder(
//                  side: BorderSide(color: Colors.black26),
//                  borderRadius: BorderRadius.circular(30)),
//              gradient: SweepGradient(
//                colors: [
//                  Colors.yellow,
//                  Colors.purple,
//                  Colors.red,
//                  Colors.green,
//                  Colors.blue
//                ],
//              ),
//            ),
            tabs: [
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(height: 50.0),
                  color: Colors.blue.shade200,
                  child: Text("Home"),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(height: 50.0),
                  color: Colors.blue.shade400,
                  child: Text("Articles"),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(height: 50.0),
                  color: Colors.blue.shade600,
                  child: Text("User"),
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                switch (index) {
                  case 0:
                    _content = "Home";
                    break;
                  case 1:
                    _content = "Articles";
                    break;
                  case 2:
                    _content = "User";
                    break;
                  default:
                    _content = "Other";
                    break;
                }
              });
            },
          ),
        ),
        body: TabBarView(children: [
          Container(
            child: Text('$_content Body'),
          ),
          Container(
            child: Text('$_content Body'),
          ),
          Container(
            child: Text('$_content Body'),
          ),
        ]),
      ),
    );
  }
}

class RoundedCorners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),
            tabs: <Widget>[
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.redAccent, width: 1),
                  ),
                  child: Text('APPS'),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.redAccent, width: 1)),
                  child: Text("MOVIES"),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.redAccent, width: 1)),
                  child: Text("GAMES"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ],
        ),
      ),
    );
  }
}

class GradientRoundedCorners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.redAccent,
                  Colors.orangeAccent,
                ],
              ),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),
            tabs: <Widget>[
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("APPS"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("MOVIES"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("GAMES"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ],
        ),
      ),
    );
  }
}

class SquareStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.redAccent,
          bottom: TabBar(
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            tabs: <Widget>[
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("APPS"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("MOVIES"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("GAMES"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ],
        ),
      ),
    );
  }
}

class DiamondStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicator: ShapeDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.redAccent,
                  Colors.orangeAccent,
                ],
              ),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            tabs: <Widget>[
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("APPS"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("MOVIES"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("GAMES"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: DiamondStyle(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ));
