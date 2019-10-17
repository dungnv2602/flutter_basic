import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class StaggerAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> _opacity;
  final Animation<double> _width;
  final Animation<double> _height;
  final Animation<EdgeInsets> _padding;
  final Animation<BorderRadius> _borderRadius;
  final Animation<Color> _color;

  static CurvedAnimation _buildCurvedIntervalAnimation(
      {parent: Animation, begin: double, end: double}) {
    return CurvedAnimation(
        parent: parent, curve: Interval(begin, end, curve: Curves.easeIn));
  }

  StaggerAnimation({Key key, this.animation})
      : _opacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(_buildCurvedIntervalAnimation(
            parent: animation, begin: 0.0, end: 0.100)),
        _width = Tween<double>(
          begin: 50.0,
          end: 150.0,
        ).animate(_buildCurvedIntervalAnimation(
            parent: animation, begin: 0.125, end: 0.250)),
        _height = Tween<double>(
          begin: 50.0,
          end: 150.0,
        ).animate(_buildCurvedIntervalAnimation(
            parent: animation, begin: 0.250, end: 0.375)),
        _padding = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 16.0),
          end: const EdgeInsets.only(bottom: 75.0),
        ).animate(_buildCurvedIntervalAnimation(
            parent: animation, begin: 0.375, end: 0.500)),
        _borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(4.0),
          end: BorderRadius.circular(75.0),
        ).animate(_buildCurvedIntervalAnimation(
            parent: animation, begin: 0.500, end: 0.750)),
        _color = ColorTween(
          begin: Colors.indigo[100],
          end: Colors.indigo[400],
        ).animate(_buildCurvedIntervalAnimation(
            parent: animation, begin: 0.500, end: 0.750)),
        super(key: key);

  /// This function is called each time the controller "ticks" a new frame.
  /// When it runs, all of the animation's values will have been
  /// updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      padding: _padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: _opacity.value,
        child: Container(
          width: _width.value,
          height: _height.value,
          decoration: BoxDecoration(
              color: _color.value,
              border: Border.all(color: Colors.indigo[300], width: 3.0),
              borderRadius: _borderRadius.value),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: animation,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      /// the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; /// 1.0 is normal speed
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            child: StaggerAnimation(
              animation: _controller.view,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

main() => runApp(MaterialApp(home: StaggerDemo()));
