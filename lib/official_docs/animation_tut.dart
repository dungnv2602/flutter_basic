import 'dart:math';

import 'package:flutter/material.dart';

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return sin(t * pi * 2);
  }
}

class AnimationSampleBasic extends StatefulWidget {
  @override
  _AnimationSampleBasicState createState() => _AnimationSampleBasicState();
}

class _AnimationSampleBasicState extends State<AnimationSampleBasic>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    final Animation curve =
        CurvedAnimation(parent: controller, curve: ShakeCurve());
    animation = Tween<double>(begin: 0, end: 250).animate(curve)

      ///the two dots in ..addListener(). This syntax means that the addListener() method is called with the return value from animate().
      ..addListener(() {
        ///The addListener() function calls setState(), so every time the Animation generates a new number, the current frame is marked dirty, which forces build() to be called again. In build(), the container changes size because its height and width now use animation.value instead of a hardcoded value. Dispose of the controller when the animation is finished to prevent memory leaks.
        setState(() {
          /// The sate that has changed here is the animation of object's value
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

///Simplifying with Animated­Widget
///The AnimatedWidget base class allows you to separate out the core widget code from the animation code. AnimatedWidget doesn’t need to maintain a State object to hold the animation. Add the following AnimatedLogo class:
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 250);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class AnimationSampleWithAnimatedWidget extends StatefulWidget {
  @override
  _AnimationSampleWithAnimatedWidgetState createState() =>
      _AnimationSampleWithAnimatedWidgetState();
}

class _AnimationSampleWithAnimatedWidgetState
    extends State<AnimationSampleWithAnimatedWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    final AnimationController controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)

      ///Next, use addStatusListener() to reverse the animation at the beginning or the end. This creates a “breathing” effect:
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addStatusListener((status) {
        print('$status');
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }
}

///Refactoring with AnimatedBuilder
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Leave out the height and width so it fills the animating parent

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const GrowTransition({Key key, this.animation, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,

        ///One tricky point in the code below is that the child looks like it’s specified twice. What’s happening is that the outer reference of child is passed to AnimatedBuilder, which passes it to the anonymous closure, which then uses that object as its child. The net result is that the AnimatedBuilder is inserted in between the two widgets in the render tree.
        child: child,
        builder: (context, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}

class AnimationSampleWithAnimatedBuilder extends StatefulWidget {
  @override
  _AnimationSampleWithAnimatedBuilderState createState() =>
      _AnimationSampleWithAnimatedBuilderState();
}

class _AnimationSampleWithAnimatedBuilderState
    extends State<AnimationSampleWithAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween<double>(begin: 0, end: 250).animate(curve)

      ///Next, use addStatusListener() to reverse the animation at the beginning or the end. This creates a “breathing” effect:
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addStatusListener((status) {
        print('$status');
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: LogoWidget(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: AnimationSampleWithAnimatedBuilder()),
    );
  }
}

main() => runApp(MyApp());
