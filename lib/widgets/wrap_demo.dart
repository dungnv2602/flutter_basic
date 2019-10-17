//A widget that displays its children in multiple horizontal or vertical runs.
//
//A Wrap lays out each child and attempts to place the child adjacent to the previous child in the main axis, given by direction, leaving spacing space in between. If there is not enough space to fit the child, Wrap creates a new run adjacent to the existing children in the cross axis.
//
//After all the children have been allocated to runs, the children within the runs are positioned according to the alignment in the main axis and according to the crossAxisAlignment in the cross axis.

/*
* The wrap widget is similar to Row or a Column widget with an added advantage that it can adjust its children according to the space available to it on the Screen. The default arrangement is horizontal (like a row) but you can make it vertical (like a column) as well by changing its direction property. You can adjust the space in between the adjacent children and the space between the lines as per your need.
* */

import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  var _demo1 = Wrap(
    spacing: 8.0, // gap between adjacent chips
    runSpacing: 4.0, // gap between lines
    children: <Widget>[
      Chip(
        avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900, child: Text('AH')),
        label: Text('Hamilton'),
      ),
      Chip(
        avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900, child: Text('ML')),
        label: Text('Lafayette'),
      ),
      Chip(
        avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900, child: Text('HM')),
        label: Text('Mulligan'),
      ),
      Chip(
        avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900, child: Text('JL')),
        label: Text('Laurens'),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return _demo1;
  }
}
