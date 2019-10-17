import 'package:flutter/material.dart';

class SnackBarApp extends StatelessWidget {
  final snackBar = SnackBar(
    content: const Text('A Snackbar'),
    action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          //Some action
        }),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: const Text('Show SnackBar'),
        ),
      ),
    );
  }
}
