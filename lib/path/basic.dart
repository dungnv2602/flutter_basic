import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();

//    path.moveTo(0.0, size.height / 2);
//    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 2);

//    path.cubicTo(size.width / 4, 3 * (size.height / 4), 3 * (size.width / 4), size.height / 4, size.width, size.height);

    path.conicTo(size.width / 4, 3 * size.height / 4, size.width, size.height, 20);




//    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
