import 'package:flutter/material.dart';

class DialogSample extends StatelessWidget {
  bool _isAccepted = false;

  Future<void> _buildSimpleDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Couldn\'t display URL:'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('url'),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _buildAlertDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('change mode?'),
            content: const Text(
                'Optimistic mode means everything is awesome. Are you sure you can handle that?'),
            actions: <Widget>[
              FlatButton(
                  child: const Text('NO THANKS'),
                  onPressed: () {
                    Navigator.pop(context, false);
                  }),
              FlatButton(
                  child: const Text('AGREE'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Simple Dialog'),
              onPressed: () {
                _buildSimpleDialog(context);
              },
            ),
            RaisedButton(
              child: Text('Alert Dialog'),
              onPressed: () {
                _buildAlertDialog(context).then<void>((bool value) {
                  _isAccepted = value;
                  print('VALUE: $_isAccepted');
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
