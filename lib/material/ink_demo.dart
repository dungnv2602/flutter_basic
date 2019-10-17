import 'package:flutter/material.dart';

class InkWidget extends StatelessWidget {
  ///This example shows how a Material widget can have a yellow rectangle drawn on it using Ink, while still having ink effects over the yellow rectangle
  var _demo1 = Material(
    color: Colors.teal.shade900,
    child: Center(
      child: Ink(
        color: Colors.yellow,
        width: 200.0,
        height: 100.0,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text('YELLOW'),
          ),
        ),
      ),
    ),
  );

  ///The following example shows how an image can be printed on a Material widget with an InkWell above it
  var _demo2 = Material(
    color: Colors.grey.shade800,
    child: Center(
      child: Ink.image(
        image: AssetImage('assets/icons/flowers.jpg'),
        fit: BoxFit.cover,
        width: 300.0,
        height: 200.0,
        child: InkWell(
          onTap: () {},
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('KITTEN', style: TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.white),),
            ),
          ),
        ),

      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _demo2;
  }
}
