import 'package:flutter/material.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter your username'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class FocusNodeSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusScopeNode _node = FocusScopeNode();

    return Scaffold(
      body: Center(
        child: FocusScope(
          node: _node,
          child: Column(
            children: <Widget>[
              TextFormField(
                onFieldSubmitted: (_) => _node.nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                onFieldSubmitted: (_) => _node.nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                onFieldSubmitted: (_) => _node.nextFocus(),
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
