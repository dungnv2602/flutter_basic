import 'package:flutter/material.dart';
import 'dart:math';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(
      begin: 50.0,
      end: 200.0,
    ).animate(_controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          print('Completed');
        } else if (state == AnimationStatus.dismissed) {
          print('Dismissed');
        }
      })
      ..addListener(() {
        print('value: ${_animation.value}');
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Open'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 50.0),
                child: Transform.rotate(
                  angle: -2 * pi * _animation.value / 200,
                  child: FlutterLogo(
                    size: _animation.value,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: FloatingActionButton(
                  onPressed: () {
                    _controller.repeat();
                  },
                  child: Icon(Icons.refresh),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
