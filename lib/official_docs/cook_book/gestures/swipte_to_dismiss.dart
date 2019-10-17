import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DismissibleApp extends StatefulWidget {
  @override
  _DismissibleAppState createState() => _DismissibleAppState();
}

class _DismissibleAppState extends State<DismissibleApp> {
  final items = List<String>.generate(30, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            /// Each Dismissible must contain a Key. Keys allow Flutter to
            /// uniquely identify Widgets.
            key: Key(item),

            /// We also need to provide a function that tells our app
            /// what to do after an item has been swiped away.
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('$item dismissed at direction $direction')));
            },
            // Show a green background as the item is swiped from left to right
            background: Container(
                padding: const EdgeInsets.only(left: 12.0),
                alignment: Alignment.centerLeft,
                color: Colors.green,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Positive Action',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  ],
                )),
            secondaryBackground: Container(
              padding: EdgeInsets.only(right: 12),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Negative Action",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.swap_horiz),
              title: Text('$item'),
            ),
          );
        });
  }
}
