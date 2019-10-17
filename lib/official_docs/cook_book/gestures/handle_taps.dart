import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return Scaffold(
      body: GestureDetector(
        // When the child is tapped, show a snackbar.
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));

          Scaffold.of(context).showSnackBar(snackBar);
        },
        // The custom button
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text('My Button'),
        ),
      ),
    );
  }
}
