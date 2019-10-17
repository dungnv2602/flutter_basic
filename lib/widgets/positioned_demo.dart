import 'package:flutter/material.dart';

class PositionedSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 25.0,
          left: 50.0,
          height: 100.0,
          width: 100.0,
          child: FlutterLogo(),
        ),
        Positioned.fill(
          top: 25.0,
          right: 50.0,
          child: FlutterLogo(
            size: 200.0,
          ),
        ),
        Positioned.directional(
            width: 100.0,
            height: 100.0,
            textDirection: TextDirection.rtl,
            child: FlutterLogo()),
        Positioned.fromRect(
          child: FlutterLogo(),
          rect: Rect.fromLTRB(50.0, 50.0, 50.0, 50.0),
        ),
        Positioned.fromRelativeRect(
          child: FlutterLogo(),
          rect: RelativeRect.fromLTRB(50.0, 50.0, 50.0, 50.0),
        )
      ],
    );
  }
}
