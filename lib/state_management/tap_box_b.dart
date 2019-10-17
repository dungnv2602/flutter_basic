import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(active: _active, onChanged: _handleTapBoxChanged),
    );
  }
}

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapBoxB({Key key, @required this.active, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
              color:
                  active ? Colors.lightGreen.shade700 : Colors.grey.shade600),
        ));
  }
}
