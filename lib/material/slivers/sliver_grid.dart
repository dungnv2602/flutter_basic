import 'package:flutter/material.dart';

class SliverGridWidget extends StatelessWidget {

  var _demo = CustomScrollView(
    slivers: <Widget>[
      SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: Text('grid item $index'),
            );
          },
          childCount: 20,
        ),
      )
    ],
  );

  var _sliverGridWithAppBar = CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.white,
        pinned: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('SliverGrid Widget', style: TextStyle(color: Colors.black87,fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
          background: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black26,
                  width: 1.0
                )
              )
            ),
          ),
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          ///no. of items in the horizontal axis
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
            );
          },
          childCount: 20,
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _sliverGridWithAppBar;
  }
}
