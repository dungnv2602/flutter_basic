import 'package:flutter/material.dart';

class TransformSample extends StatefulWidget {
  @override
  _TransformSampleState createState() => _TransformSampleState();
}

class _TransformSampleState extends State<TransformSample> {
  ///The angle parameter lets us set an angle (in radians) the child will be rotated by.
  ///The square has sides of 100.0. This code rotates the container about the lower right vertex of the square. Since the offset is 50.0 to the right and 50.0 below, the center of the child is defined by the offset (50.0,50.0)
  var _rotate = Transform.rotate(
    angle: 1.0,

    ///the center of the child is defined by the offset
    origin: Offset(50.0, 50.0),

    ///50.0 to the right and 50.0 below
    child: Container(
      height: 200.0,
      width: 200.0,
      color: Colors.pink,
    ),
  );

  ///When the origin is left blank, the center of the widget is taken. When scaling, the changes on each side are exactly the on each.

  var _scale = Transform.scale(
    scale: 0.5,

    ///This is achieved by providing the origin (50.0,50.0). This offset corresponds to the lower right corner.
    origin: Offset(50.0, 50.0),
    child: Container(
      height: 200.0,
      width: 200.0,
      color: Colors.yellow,
    ),
  );

  ///Transform.translate translates the child of the transform widget by a specified amount in the X and Y direction. We supply an Offset which has the amount by which we want to move the child by in the X and Y directions.
  var _translate = Transform.translate(

    ///Here we supply an Offset which moves the container 100.0 in the X direction. Any change in the second parameter would move it in the Y direction.
    offset: Offset(100.0, 0.0),
    child: Container(
      height: 100.0,
      width: 100.0,
      color: Colors.yellow,
    ),
  );

  ///skew around the Y axis of 0.3 and a rotation of π/12 radians around the Z axis
  ///A Skew is essentially titling the child in one direction while keeping the sides parallel.
  var _constructor = Transform(
    transform: Matrix4.skewY(0.3)
      ..rotateZ(3.14 / 12.0),
    origin: Offset(50.0, 50.0),
    child: Container(
      height: 100.0,
      width: 100.0,
      color: Colors.blue,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: _constructor),
    );
  }
}
