import 'package:flutter/material.dart';

class FromLeftRoute extends PageRouteBuilder {
  final Widget widget;

  FromLeftRoute(this.widget)
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          ///Notice that the SlideTransition can be replaced by any other transition widgets provided by Flutter such as ScaleTransition or FadeTransition.
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.fastOutSlowIn)),
            child: child,
          );
        });
}

class FromRightRoute extends PageRouteBuilder {
  final Widget widget;

  FromRightRoute(this.widget)
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          ///Notice that the SlideTransition can be replaced by any other transition widgets provided by Flutter such as ScaleTransition or FadeTransition.
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.fastOutSlowIn)),
            child: child,
          );
        });
}

class TopDownRoute extends PageRouteBuilder {
  final Widget widget;

  TopDownRoute(this.widget)
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          ///Notice that the SlideTransition can be replaced by any other transition widgets provided by Flutter such as ScaleTransition or FadeTransition.
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.fastOutSlowIn)),
            child: child,
          );
        });
}

class BottomUpRoute extends PageRouteBuilder {
  final Widget widget;

  BottomUpRoute(this.widget)
      : super(pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
            child: child,
          );
        });
}

class ScaleRoute extends PageRouteBuilder {
  final Widget widget;

  ScaleRoute(this.widget)
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return ScaleTransition(
            scale: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 1.5,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.50,
                    1.00,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: child,
            ),
          );
        });
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Forward to Second Screen',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.forward),
          onPressed: () {
            Navigator.push(context, ScaleRoute(SecondScreen()));
          }),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Back to First Screen',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    );
  }
}
