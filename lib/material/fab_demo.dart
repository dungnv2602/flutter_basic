import 'package:flutter/material.dart';

class FABWidget extends StatelessWidget {
  var _simpleFAB = FloatingActionButton(
    onPressed: () {
      // Add your onPressed code here!
    },
    child: Icon(Icons.thumb_up),
    backgroundColor: Colors.pink,
    foregroundColor: Colors.white,
    mini: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  );

  ///FloatingActionButton.extended offers a wide FAB, usually with an icon and a label inside it
  ///Instead of a child parameter, we now have label and icon parameters.
  var _extendedFAB = FloatingActionButton.extended(
    onPressed: () {
      // Add your onPressed code here!
    },
    label: Text('Approve'),
    icon: Icon(Icons.thumb_up),
    backgroundColor: Colors.pink,
    foregroundColor: Colors.white,
  );

  var _extendedCustomFAB = FloatingActionButton.extended(
    onPressed: () {
      // Add your onPressed code here!
    },
    label: Text('Approve'),
    icon: Icon(Icons.thumb_up),
    backgroundColor: Colors.pink,
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blueAccent, width: 4.0)),
  );

  var _customBorder = FloatingActionButton(
    child: Icon(Icons.thumb_up),
    backgroundColor: Colors.pink,
    foregroundColor: Colors.white,
    shape: _DiamondBorder(), onPressed: () {},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Action Button Sample'),
      ),
      body: Center(child: Text('Press the button below!')),
      floatingActionButton: _customBorder,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}

class _DiamondBorder extends ShapeBorder {
  const _DiamondBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
