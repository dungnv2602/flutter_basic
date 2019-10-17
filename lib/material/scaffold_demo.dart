import 'package:flutter/material.dart';


class ScaffoldWidget extends StatefulWidget {
  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample code'),
      ),
      body: Column(
        children: <Widget>[
          Text('You have pressed the button $_count times.'),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        tooltip: 'increment counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ScaffoldWidget2 extends StatefulWidget {
  @override
  _ScaffoldWidget2State createState() => _ScaffoldWidget2State();
}

class _ScaffoldWidget2State extends State<ScaffoldWidget2> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      persistentFooterButtons: <Widget>[
        RaisedButton(
          onPressed: () {
            _key.currentState.showSnackBar(SnackBar(
              content: Text(
                'you have a message!',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.justify,
              ),
              backgroundColor: Colors.blueAccent,
              duration: Duration(seconds: 2),
              action: SnackBarAction(
                label: 'I know!',
                textColor: Colors.white,
                disabledTextColor: Colors.black26,
                onPressed: () {
                  print('Snack bar test action!');
                },
              ),
            ));
          },
          color: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
        )
      ],
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        elevation: 4.0,
        iconSize: 20.0,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        tooltip: 'increment counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
