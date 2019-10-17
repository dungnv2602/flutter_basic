import 'package:flutter/material.dart';

///Builds a widget tree that can depend on the parent widget's size.
class LayoutBuilderSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.lightBlue,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  color: Colors.indigo,
                ),
                flex: 1,
              )
            ],
          );
        } else {
          return Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.lightBlue,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  color: Colors.indigo,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  color: Colors.pink,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
                flex: 1,
              )
            ],
          );
        }
      },
    );
  }
}
