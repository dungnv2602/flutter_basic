//A widget that aligns its child within itself and optionally sizes itself based on the child's size.

import 'package:flutter/material.dart';

class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: Align(
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}

class AlignDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: Align(
          alignment: Alignment(0.2, 0.6),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
