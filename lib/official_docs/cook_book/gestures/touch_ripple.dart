import 'package:flutter/material.dart';

class TouchRippleSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: const Text('This is a Flat Button')));
                },
                child: const Text('Flat Button')),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Ink Well Button'),
              ),
              onTap: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: const Text('This is a Ink Well Button')));
              },
            )
          ],
        ),
      ),
    );
  }
}
