//A widget that insets its child by sufficient padding to avoid intrusions by the operating system.
//
//For example, this will indent the child by enough to avoid the status bar at the top of the screen.
//
//It will also indent the child by the amount necessary to avoid The Notch on the iPhone X, or other similar creative physical features of the display.
//
//When a minimum padding is specified, the greater of the minimum padding or the safe area padding will be applied.

//SafeArea is basically a glorified Padding widget. If you wrap another widget with SafeArea, it adds any necessary padding needed to keep your widget from being blocked by the system status bar, notches, holes, rounded corners and other "creative" features by manufactures.

import 'package:flutter/material.dart';

class SafeAreaDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: Text(
            'My Widget: This is my widget. It has some content that I don\'t want '
                'blocked by certain manufacturers who add notches, holes, and round corners.'
        ),
      ),
    );
  }
}
