import 'package:flutter/material.dart';

class TextEditingControllerSample extends StatefulWidget {
  @override
  _TextEditingControllerSampleState createState() =>
      _TextEditingControllerSampleState();
}

class _TextEditingControllerSampleState
    extends State<TextEditingControllerSample> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              ///using onChanged
              onChanged: (text) {
                print('First text field: $text');
              },
            ),
            TextField(
              ///using TextEditingController
              controller: myController,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the TextEditingController.
                  content: Text(myController.text),
                );
              });
        },
        tooltip: 'Show me the text!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
