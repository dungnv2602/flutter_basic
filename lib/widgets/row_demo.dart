import 'package:flutter/material.dart';

///A widget that displays its children in a horizontal array.
//
//To cause a child to expand to fill the available horizontal space, wrap the child in an Expanded widget.
//
//The Row widget does not scroll (and in general it is considered an error to have more children in a Row than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.
//
//For a vertical variant, see Column.
//
//If you only have one child, then consider using Align or Center to position the child.

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Deliver features faster',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                'Craft beautiful UIs',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain, //otherwise the logo will be tiny
                child: const FlutterLogo(),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            const FlutterLogo(),
            const Expanded(
              child: Text('Hello World!'),
            ),
            const Icon(Icons.sentiment_very_satisfied),
          ],
        ),
      ],
    );
  }
}
