import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  ///Initialise focus nodes
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextField(
            focusNode: nodeOne,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.continueAction,
            autocorrect: false,
            textCapitalization: TextCapitalization.sentences,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300),
            cursorColor: Colors.red,
            cursorRadius: Radius.circular(16.0),
            cursorWidth: 16.0,
            maxLength: 1000,

            ///Sometimes, we need a TextField that expands when one line is finished. In Flutter it is slightly odd (yet easy) to do. To do this, we set maxLines to null, which is 1 by default.
            maxLines: null,
            decoration: InputDecoration(
                icon: Icon(Icons.print),
                labelText: 'demo label',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
                hintText: 'demo hint',

                ///Although I have done it in this example, generally do not change the hint colour as it is confusing to users.
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.yellow),

                ///Use “helperText” if you do not want a label but you want a persisting message for the user.
                helperText: 'demo helper',
                helperStyle:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.teal),
                prefixIcon: Icon(Icons.airplanemode_active),
                suffixIcon: Icon(Icons.add_circle),
                prefix: CircularProgressIndicator(),
                suffix: CircularProgressIndicator(),

                ///Use “border” to give a border to the TextField
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                )),
          ),
          TextField(
            focusNode: nodeTwo,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.send,
            autocorrect: true,
            obscureText: true,

            ///Use “decoration: null” or InputDecoration.collapsed to remove the default underline on a TextField
            decoration: null,
          ),
          RaisedButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(nodeTwo);
            },
            child: Text('Next Field'),
          )
        ],
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Hello ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' world!'),
            ],
          ),
        ),
      ),
    );
  }
}
