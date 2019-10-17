//A box with a specified size.
//
//If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget's parent). If either the width or height is null, this widget will size itself to match the child's size in that dimension.
//
//If not given a child, this widget will size itself to the given width and height, treating nulls as zero.
//
//The new SizedBox.expand constructor can be used to make a SizedBox that sizes itself to fit the parent. It is equivalent to setting width and height to double.infinity.
//It’s one of the simplest but most useful Widgets

import 'package:flutter/material.dart';

class SizedBoxDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 200,
        height: 300,
        child: const Card(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

//SizedBox can work in a similar fashion as ConstrainedBox
class SizedBoxDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.expand(
        child: const Card(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

//ConstrainedBox, a more generic version of this class that takes arbitrary BoxConstraints instead of an explicit width and height.
//A widget that imposes additional constraints on its child.
//
//For example, if you wanted child to have a minimum height of 50.0 logical pixels, you could use const BoxConstraints(minHeight: 50.0) as the constraints.
//Using BoxConstraints you specify how much space a widget can have — you specify min/max of height/width.
//BoxConstraints.expand uses infinite (all the available) amount of space unless specified:
class ConstrainedBoxDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: const Card(
        child: const Text('Hello World!'),
        color: Colors.yellow,
      ),
    );
  }
}

class ConstrainedBoxDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 300,
        maxWidth: double.infinity,
        minHeight: 300,
        maxHeight: double.infinity,
      ),
      child: const Card(
        child: const Text('Hello World!'),
        color: Colors.yellow,
      ),
    );
  }
}

//FittedBox scales and positions its child within itself according to fit.
class FittedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: YourPictureWidget(),
      ),
    );
  }
}

class YourPictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
