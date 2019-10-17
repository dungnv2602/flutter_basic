import 'package:flutter/material.dart';

///A widget that uses the table layout algorithm for its children.
///A grid you don;t want to scroll.
///This widget will help you arrange your widgets of varying or same size in a grid fashion. You simply need to create a Table widget and add TableRow widgets to it. You can control parameters like border and columnWidth. The Table widget will resize its Row according to the size of children provided to the TableRow widget. You can set a vertical alignment property to the Table widget to specify how the widgets (Row cells) are aligned vertically.

class TableSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
      children: <TableRow>[
        ///First table row with 3 children
        TableRow(children: <Widget>[
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              margin: EdgeInsets.all(2),
              color: Colors.red,
              width: 48.0,
              height: 100.0,
              child: Center(
                child: Text(
                  "Row 1 \n Element 1",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 6.0),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              margin: EdgeInsets.all(2),
              color: Colors.orange,
              width: 50.0,
              height: 50.0,
              child: Center(
                child: Text(
                  "Row 1 \n Element 2",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 6.0),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              margin: EdgeInsets.all(2),
              color: Colors.blue,
              width: 50.0,
              height: 50.0,
              child: Center(
                child: Text(
                  "Row 1 \n Element 3",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 6.0),
                ),
              ),
            ),
          ),
        ]),

        ///Second table row with 3 children
        TableRow(children: <Widget>[
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              margin: EdgeInsets.all(2),
              color: Colors.lightBlue,
              width: 50.0,
              height: 48.0,
              child: Center(
                child: Text(
                  "Row 2 \n Element 1",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 6.0),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              margin: EdgeInsets.all(2),
              color: Colors.green,
              width: 48.0,
              height: 48.0,
              child: Center(
                child: Text(
                  "Row 2 \n Element 2",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 6.0),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              margin: EdgeInsets.all(2),
              color: Colors.blue,
              width: 50.0,
              height: 100.0,
              child: Center(
                child: Text(
                  "Row 2 \n Element 3",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 6.0),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
