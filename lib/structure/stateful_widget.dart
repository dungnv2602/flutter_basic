import 'package:flutter/material.dart';

class YellowBird extends StatefulWidget {
  const YellowBird({
    Key key,
    this.color = Colors.greenAccent,
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  _YellowBirdState createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  double _size = 1.0;
  void grow() {
    setState(() {
      _size += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      transform: Matrix4.diagonal3Values(_size, _size, 1.0),
      child: widget.child,
    );
  }
}
