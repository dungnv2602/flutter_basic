//A widget that controls how a child of a Row, Column, or Flex flexes.
//
//Using a Flexible widget gives a child of a Row, Column, or Flex the flexibility to expand to fill the available space in the main axis (e.g., horizontally for a Row or vertically for a Column), but, unlike Expanded, Flexible does not require the child to fill the available space.
//
//A Flexible widget must be a descendant of a Row, Column, or Flex, and the path from the Flexible widget to its enclosing Row, Column, or Flex must contain only StatelessWidgets or StatefulWidgets (not other kinds of widgets, like RenderObjectWidgets).
import 'package:flutter/material.dart';

class FlexibleDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //the sum of all the flex values determines how much space each Flexible will use
      Flexible(flex: 2, child: Container(color: Colors.cyan)),
      Flexible(flex: 3, child: Container(color: Colors.teal)),
      Flexible(flex: 1, child: Container(color: Colors.indigo)),
    ]);
  }
}

class FlexibleDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //the sum of all the flex values determines how much space each Flexible will use
      Flexible(
          flex: 2, fit: FlexFit.loose, child: Container(color: Colors.cyan)),
      Flexible(flex: 3, child: Container(color: Colors.teal)),
      Flexible(flex: 1, child: Container(color: Colors.indigo)),
    ]);
  }
}

class FlexibleDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //the sum of all the flex values determines how much space each Flexible will use
      Container(height: 100, color: Colors.cyan),
      Flexible(flex: 3, child: Container(color: Colors.teal)),
      Flexible(flex: 1, child: Container(color: Colors.indigo)),
    ]);
  }
}
