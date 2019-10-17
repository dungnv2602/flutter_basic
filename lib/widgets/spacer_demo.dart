///Spacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets in a Flex container, like Row or Column.
import 'package:flutter/material.dart';

class SpacerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Text('Begin'),
          Spacer(), //Defaults to a flex of one.
          Text('Middle'),
          Spacer(
              flex:
                  2), //Gives twice the space between Middle and End than Begin and Middle.
          Text('End')
        ],
      ),
    );
  }
}
