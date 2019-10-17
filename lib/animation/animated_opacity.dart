import 'package:flutter/material.dart';

///A widget that makes its child partially transparent.
///This class paints its child into an intermediate buffer and then blends the child backF into the scene partially transparent.
///For values of opacity other than 0.0 and 1.0, this class is relatively expensive because it requires painting the child into an intermediate buffer. For the value 0.0, the child is simply not painted at all. For the value 1.0, the child is painted immediately without an intermediate buffer.
///Animating an Opacity widget directly causes the widget (and possibly its subtree) to rebuild each frame, which is not very efficient. Consider using an AnimatedOpacity instead.

///FadeTransition, an explicitly animated version of this widget, where an Animation is provided by the caller instead of being built in.

class LogoFade extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;

  void _changeOpacity() =>
      setState(() => opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 3),
          child: FlutterLogo(),
        ),
        RaisedButton(
          child: Text('Fade Logo'),
          onPressed: _changeOpacity,
        )
      ],
    );
  }
}

class TextOpacitySimple extends StatefulWidget {
  @override
  TextOpacitySimpleState createState() {
    return new TextOpacitySimpleState();
  }
}

class TextOpacitySimpleState extends State<TextOpacitySimple> {
  @override
  void initState() {
    super.initState();
  }

  var _opacity = 0.0;
  var _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _opacity = _opacity == 0.0 ? 1.0 : 0.0;
        });
      },
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          width: _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.blueGrey,
          ),
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: _opacity,
            child: Text(
              '#Hashtag',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ),
        ),
      ),
    );
  }
}

class IconToMessage extends StatefulWidget {
  @override
  _IconToMessageState createState() => _IconToMessageState();
}

class _IconToMessageState extends State<IconToMessage> {
  bool _isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              _isAdded = !_isAdded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 350),
            curve: Curves.linear,
            decoration: BoxDecoration(
              color: _isAdded ? Colors.transparent : Colors.blue,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 3.0, color: Colors.blue),
            ),
            width: _isAdded ? 160 : 60,
            height: 60,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                      opacity: _isAdded ? 0.0 : 1.0,
                      child: Icon(Icons.person_add, color: Colors.white)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 550),
                    opacity: _isAdded ? 1.0 : 0.0,
                    child: Text(
                      "MESSAGE",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
