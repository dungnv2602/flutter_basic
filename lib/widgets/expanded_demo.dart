//A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.
//
//Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space along the main axis (e.g., horizontally for a Row or vertically for a Column). If multiple children are expanded, the available space is divided among them according to the flex factor.
//
//An Expanded widget must be a descendant of a Row, Column, or Flex, and the path from the Expanded widget to its enclosing Row, Column, or Flex must contain only StatelessWidgets or StatefulWidgets (not other kinds of widgets, like RenderObjectWidgets).
import 'package:flutter/material.dart';

class ExpandedDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
          ),
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
          )
        ],
      ),
    );
  }
}

class ExpandedDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
              height: 100,
            ),
          ),
          Container(
            color: Colors.blue,
            height: 100,
            width: 50,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
