import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

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
