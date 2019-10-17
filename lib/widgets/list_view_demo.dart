import 'package:flutter/material.dart';

class ListViewSamples extends StatelessWidget {
  ///The default constructor takes an explicit List<Widget> of children. This constructor is appropriate for list views with a small number of children because constructing the List requires doing work for every child that could possibly be displayed in the list view instead of just those children that are actually visible.
  var _s1 = ListView(
    physics: BouncingScrollPhysics(),
    padding: const EdgeInsets.all(8.0),
    children: <Widget>[
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(child: Text('Entry A')),
      ),
      Container(
        height: 50,
        color: Colors.amber[500],
        child: const Center(child: Text('Entry B')),
      ),
      Container(
        height: 50,
        color: Colors.amber[100],
        child: const Center(child: Text('Entry C')),
      ),
    ],
  );

  ///The ListView.builder constructor takes an IndexedWidgetBuilder, which builds the children on demand. This constructor is appropriate for list views with a large (or infinite) number of children because the builder is called only for those children that are actually visible.
  static final List<String> entries = <String>['A', 'B', 'C'];
  static final List<int> colorCodes = <int>[600, 500, 100];
  var _s2 = ListView.builder(
    physics: BouncingScrollPhysics(),
    padding: const EdgeInsets.all(8.0),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) => Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(
            child: Text('Entry ${entries[index]}'),
          ),
        ),
  );

  ///The ListView.separated constructor takes two IndexedWidgetBuilders: itemBuilder builds child items on demand, and separatorBuilder similarly builds separator children which appear in between the child items. This constructor is appropriate for list views with a fixed number of children.
  var _s3 = ListView.separated(
    physics: BouncingScrollPhysics(),
    padding: const EdgeInsets.all(8.0),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) => Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(
            child: Text('Entry ${entries[index]}'),
          ),
        ),
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
  static const senderList = <String>['Joe1', 'Joe2', 'Joe3'];
  static const subjectList = <String>['Subject1', 'Subject2', 'Subject3'];
  var _advanced = ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: senderList.length,
    itemBuilder: (context, position) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                    child: Text(
                      senderList[position],
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                    child: Text(
                      subjectList[position],
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '5m',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.star_border,
                        size: 35.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(
            height: 2.0,
            color: Colors.grey,
          )
        ],
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return _advanced;
  }
}
