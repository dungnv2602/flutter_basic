//A convenience widget that combines common painting, positioning, and sizing widgets.
//
//A container first surrounds the child with padding (inflated by any borders present in the decoration) and then applies additional constraints to the padded extent (incorporating the width and height as constraints, if either is non-null). The container is then surrounded by additional empty space described from the margin.
//
//During painting, the container first applies the given transform, then paints the decoration to fill the padded extent, then it paints the child, and finally paints the foregroundDecoration, also filling the padded extent.
//
//Containers with no children try to be as big as possible unless the incoming constraints are unbounded, in which case they try to be as small as possible. Containers with children size themselves to their children. The width, height, and constraints arguments to the constructor override this.

import 'package:flutter/material.dart';

class ContainerDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.amber[600],
        width: 48.0,
        height: 48.0,
      ),
    );
  }
}

class ContainerDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(height: 200.0),
        padding: const EdgeInsets.all(0.0),
        color: Colors.blue[600],
        child: Text('Hello World!',
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.white)),
        transform: Matrix4.rotationZ(0.1),
      ),
    );
  }
}

//Decoration is usually used on a Container/DecoratedBox widget to change how the container looks.

//An immutable description of how to paint a box.
//
//The BoxDecoration class provides a variety of ways to draw a box.
//
//The box has a border, a body, and may cast a boxShadow.
//
//The shape of the box can be a circle or a rectangle. If it is a rectangle, then the borderRadius property controls the roundness of the corners.
//
//The body of the box is painted in layers. The bottom-most layer is the color, which fills the box. Above that is the gradient, which also fills the box. Finally there is the image, the precise alignment of which is controlled by the DecorationImage class.
//
//The border paints over the body; the boxShadow, naturally, paints below it.

///BoxDecoration
class BoxDecorationDemo extends StatelessWidget {
  var _container = Container(
    decoration: BoxDecoration(
      color: const Color(0xff7c94b6),
      image: DecorationImage(
        image: ExactAssetImage('images/flowers.jpg'),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Colors.black,
        width: 8.0,
      ),
    ),
  );

  var _decoratedBox = DecoratedBox(
    decoration: BoxDecoration(
        gradient: RadialGradient(
      center: const Alignment(-0.5, -0.6),
      radius: 0.15,
      colors: <Color>[
        const Color(0xFFEEEEEE),
        const Color(0xFF111133),
      ],
      stops: <double>[0.9, 1.0],
    )),
  );

  ///image: DecorationImage
  ///Puts an image as a background:
  var _decorationImage = BoxDecoration(
      color: Colors.yellow,
      image: DecorationImage(
          fit: BoxFit.contain,
          image: const ExactAssetImage('images/flowers.jpg')));

  ///border: Border
  ///Specifies how should the border of the Container look like.
  var _border = BoxDecoration(
      color: Colors.yellow,
      border: Border.all(
        color: Colors.black,
        width: 3,
      ));

  ///borderRadius: BorderRadius
  ///Enables border corners to be rounded.
  ///borderRadius does not work if the shape of the decoration is BoxShape.circle

  var _borderRadius = BoxDecoration(
      color: Colors.yellow,
      border: Border.all(
        color: Colors.black,
        width: 3,
      ),
      borderRadius: BorderRadius.all(Radius.circular(18)));

  ///shape: BoxShape
  ///Box decoration can be either a rectangle/square or an ellipse/circle.
  ///For any other shape, you can use ShapeDecoration instead of BoxDecoration
  var _boxShape = BoxDecoration(
    color: Colors.yellow,
    shape: BoxShape.circle,
  );

  ///boxShadow: List<BoxShadow>
  ///Adds shadow to the Container.
  ///This parameter is a list because you can specify multiple different shadows and merge them together.
  var _boxShadow = BoxDecoration(color: Colors.yellow, boxShadow: const [
    BoxShadow(blurRadius: 10),
  ]);

  ///gradient
  ///There are three types of gradients: LinearGradient, RadialGradient and SweepGradient.
  var _linearGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: const [
        Colors.red,
        Colors.blue,
      ],
    ),
  );

  var _radialGradient = BoxDecoration(
    gradient: RadialGradient(
      colors: const [Colors.yellow, Colors.blue],
      stops: const [0.4, 1.0],
    ),
  );

  var _sweepGradient = BoxDecoration(
    gradient: SweepGradient(
      colors: const [
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.red,
        Colors.blue,
      ],
      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _decoratedBox;
  }
}
