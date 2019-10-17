//A widget that positions its children relative to the edges of its box.
//
//This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.
//
//Each child of a Stack widget is either positioned or non-positioned. Positioned children are those wrapped in a Positioned widget that has at least one non-null property. The stack sizes itself to contain all the non-positioned children, which are positioned according to alignment (which defaults to the top-left corner in left-to-right environments and the top-right corner in right-to-left environments). The positioned children are then placed relative to the stack according to their top, right, bottom, and left properties.

//The stack paints its children in order with the first child being at the bottom. If you want to change the order in which the children paint, you can rebuild the stack with the children in the new order. If you reorder the children in this way, consider giving the children non-null keys. These keys will cause the framework to move the underlying objects for the children to their new locations rather than recreate them at their new location.

import 'package:flutter/material.dart';

///Stack
///The Stack widget allows us to put up multiple layers of widgets onto the screen.
///The widget takes multiple children and orders them from bottom to top. So the first item is the bottommost and the last is the topmost.
///The size of the Stack is the size of the largest member in the layer. So if the bottom layer covers the complete screen then the size of the Stack is the complete screen.
///Each member in the stack needs to be positioned or aligned, or else it ends up in the top left corner by default.
class StackDemo extends StatelessWidget {
  var _demo1 = Center(
    child: Stack(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 90,
          height: 90,
          color: Colors.green,
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.blue,
        )
      ],
    ),
  );

  var _demo2 = Center(
    child: SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45
                ])),
            child: Text(
              'Foreground Text',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    ),
  );

  var _demo3 = Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Material(color: Colors.yellowAccent),
      Banner(
        message: 'Top Start',
        location: BannerLocation.topStart,
      ),
      Banner(
        message: 'Top End',
        location: BannerLocation.topEnd,
      ),
      Banner(
        message: 'Bottom Start',
        location: BannerLocation.bottomStart,
      ),
      Banner(
        message: 'Bottom End',
        location: BannerLocation.bottomEnd,
      ),
    ],
  );

  ///With your own Widgets, you need to place them in Positioned Widget
  ///Positioned: A widget that controls where a child of a Stack is positioned. A Positioned widget must be a descendant of a Stack
  static const double _iconSize = 50;
  var _demo4 = Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Material(color: Colors.yellowAccent),
      Positioned(
        top: 0,
        left: 0,
        child: Icon(Icons.call, size: _iconSize),
      ),
      Positioned(
        top: 340,
        left: 250,
        child: Icon(
          Icons.call,
          size: 50,
        ),
      )
    ],
  );

  ///If you don’t want to guess the top/bottom values you can use   LayoutBuilder to retrieve them
  var _demo5 = LayoutBuilder(
      builder: (context, constraints) => Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Material(color: Colors.yellowAccent),
              Positioned(
                top: 0,
                child: Icon(Icons.star, size: _iconSize),
              ),
              Positioned(
                top: constraints.maxHeight - _iconSize,
                left: constraints.maxWidth - _iconSize,
                child: Icon(Icons.call, size: _iconSize),
              )
            ],
          ));

  var _demo6 = Stack(
    children: <Widget>[
      //Max size
      Container(
        color: Colors.green,
      ),
      Container(color: Colors.blue, height: 300, width: 300),
      Container(color: Colors.pink, height: 150, width: 150)
    ],
  );

  var _demo7 = Stack(
    children: <Widget>[
      //Max size
      Container(
        color: Colors.green,
      ),
      Container(color: Colors.blue, height: 300, width: 300),
      Align(
          alignment: Alignment.topRight,
          child: Container(color: Colors.pink, height: 150, width: 150))
    ],
  );

  var _demo8 = Stack(
    children: <Widget>[
      //Max size
      Container(
        color: Colors.green,
      ),
      Container(color: Colors.blue, height: 300, width: 300),
      Positioned(
          ///the child will be 40.0 away from top and right and no other constraints on the other sides.
          right: 40,
          top: 40,
          child: Container(color: Colors.pink, height: 150, width: 150))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _demo8;
  }
}

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icons/flowers.jpg'),
                fit: BoxFit.fitHeight),
          ),
        ),
        Positioned(
          bottom: 48.0,
          left: 10.0,
          right: 10.0,
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'New York',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
