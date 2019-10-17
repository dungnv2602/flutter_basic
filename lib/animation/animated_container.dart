import 'package:flutter/material.dart';

///A container that gradually changes its values over a period of time.
///The AnimatedContainer will automatically animate between the old and new values of properties when they change using the provided curve and duration. Properties that are null are not animated. Its child and descendants are not animated.
///This class is useful for generating simple implicit transitions between different parameters to Container with its internal AnimationController.

class AnimatedContainerSample extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerSample> {
  static double _height = 150.0;
  static double _width = 150.0;
  static ColorSwatch _color = Colors.redAccent;
  static double _border = 2.0;
  static BoxShape _shape = BoxShape.rectangle;
  static Curve _curve = Curves.decelerate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Center(
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: _curve,
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: _color,
                shape: _shape,
                border: Border.all(width: _border),
              ),
            ),
          ),

          /// property animation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('Height'),
                onPressed: () {
                  setState(() {
                    _height = 250.0;
                  });
                },
              ),
              RaisedButton(
                child: Text("Width"),
                onPressed: () {
                  setState(() {
                    _width = 250.0;
                  });
                },
              ),
              RaisedButton(
                child: Text("Color"),
                onPressed: () {
                  setState(() {
                    _color = Colors.greenAccent;
                  });
                },
              ),
              RaisedButton(
                child: Text("Border"),
                onPressed: () {
                  setState(() {
                    _border = 10.0;
                  });
                },
              ),
            ],
          ),

          /// Animation Curves
          Wrap(
            children: <Widget>[
              RaisedButton(
                child: Text('easeInOut'),
                onPressed: () {
                  setState(() {
                    _curve = Curves.easeInOut;
                    _height = 250.0;
                    _width = 250.0;
                    _color = Colors.greenAccent;
                    _border = 10.0;
                  });
                },
              ),
              RaisedButton(
                child: Text("bounceInOut"),
                onPressed: () {
                  setState(() {
                    _curve = Curves.bounceInOut;
                    _height = 250.0;
                    _width = 250.0;
                    _color = Colors.greenAccent;
                    _border = 10.0;
                  });
                },
              ),
              RaisedButton(
                child: Text("elasticInOut"),
                onPressed: () {
                  setState(() {
                    _curve = Curves.elasticInOut;
                    _height = 250.0;
                    _width = 250.0;
                    _color = Colors.greenAccent;
                    _border = 10.0;
                  });
                },
              ),
              FlatButton(
                child: Text('Reset'),
                onPressed: () {
                  setState(() {
                    _height = 150.0;
                    _width = 150.0;
                    _color = Colors.redAccent;
                    _border = 5.0;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class ChartExample extends StatefulWidget {
  @override
  _ChartExampleState createState() => _ChartExampleState();
}

class _ChartExampleState extends State<ChartExample> {
  var _height = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          width: 60.0,
          height: _height,
          color: Colors.green,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _height = _height == 50.0 ? _height = 300.0 : _height = 50.0;
          });
        },
        icon: Icon(Icons.directions_car),
        label: Text('Update Fuel Prices'),
      ),
    );
  }
}

class FlightExample extends StatefulWidget {
  @override
  _FlightExampleState createState() => _FlightExampleState();
}

class _FlightExampleState extends State<FlightExample> {
  var _alignment = Alignment.bottomCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        padding: EdgeInsets.all(10.0),
        duration: Duration(seconds: 2),
        alignment: _alignment,
        child: Container(
          height: 50.0,
          child: Icon(
            Icons.airplanemode_active,
            size: 50.0,
            color: Colors.blueAccent,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _alignment = _alignment == Alignment.center
                ? Alignment.bottomCenter
                : Alignment.center;
          });
        },
        icon: Icon(Icons.airplanemode_active),
        label: Text('Take Flight'),
      ),
    );
  }
}

class GradientTransform extends StatefulWidget {
  @override
  _GradientTransformState createState() => _GradientTransformState();
}

class _GradientTransformState extends State<GradientTransform> {
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
  var list = [
    Colors.lightGreen,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          height: 300.0,
          width: 300.0,
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                  colors: list, begin: top, end: bottom, stops: [0.0, 1.0]),
              color: Colors.lightGreen),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            top = FractionalOffset.bottomLeft;
            bottom = FractionalOffset.topRight;
            list = [Colors.blueAccent, Colors.yellowAccent];
          });
        },
        label: Text('Transform'),
        icon: Icon(Icons.update),
      ),
    );
  }
}
