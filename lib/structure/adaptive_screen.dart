import 'package:flutter/material.dart';

class OrientationSample extends StatelessWidget {
  String name = "Deven Joshi";

  Widget _buildVerticalLayout() {
    return Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Icon(
              Icons.account_circle,
              size: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 32.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalLayout() {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Icon(
                    Icons.account_circle,
                    size: 100.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 32.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(6, (n) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 32.0),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _solutionOne() => OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? _buildVerticalLayout()
            : _buildHorizontalLayout();
      });

  Widget _solutionTwo(context) => Container(
      child: MediaQuery.of(context).orientation == Orientation.portrait
          ? _buildVerticalLayout()
          : _buildHorizontalLayout());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _solutionTwo(context),
    );
  }
}
typedef Null ItemSelectedCallback(int value);

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
              onTap: () {

              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      position.toString(),
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailScreen extends StatefulWidget {
  final int data;

  DetailScreen(this.data);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.data.toString(),
                style: TextStyle(fontSize: 36.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
