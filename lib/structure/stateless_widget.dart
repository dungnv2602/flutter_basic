import 'package:flutter/material.dart';

class Frog extends StatelessWidget {
  final Color color;
  final Widget child;
  const Frog({
    Key key,
    this.color = Colors.greenAccent,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: color, child: child);
  }
}
