import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureBuilderWidget extends StatefulWidget {
  @override
  _FutureBuilderWidgetState createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  String _url = 'https://jsonplaceholder.typicode.com/posts/1';

  bool _isButtonClicked = false;
  var _buttonIcon = Icons.cloud_download;
  var _buttonText = 'Fetch Data';
  var _buttonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Demo>(
          ///If future is null then API will not be called as soon as the screen
          ///loads. This can be used to make this Future Builder dependent
          ///on a button click.
          future: _isButtonClicked ? getDemoResponse(_url) : null,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {

              ///when the future is null
              case ConnectionState.none:
                return Text(
                  'Press the button to fetch data',
                  textAlign: TextAlign.center,
                );

              case ConnectionState.active:

              ///when data is being fetched
              case ConnectionState.waiting:
                return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));

              case ConnectionState.done:

                ///task is complete with an error (eg. When you
                ///are offline)
                if (snapshot.hasError)
                  return Text(
                    'Error:\n\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  );

                ///task is complete with some data
                return Text(
                  'Fetched Data:\n\n${snapshot.data.title}',
                  textAlign: TextAlign.center,
                );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: _buttonColor,
        icon: Icon(
          _buttonIcon,
          color: Colors.white,
        ),
        label: Text(
          _buttonText,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            _isButtonClicked == false
                ? _isButtonClicked = true
                : _isButtonClicked = false;
            if (!_isButtonClicked) {
              _buttonIcon = Icons.cloud_download;
              _buttonColor = Colors.green;
              _buttonText = "Fetch Data";
            } else {
              _buttonIcon = Icons.replay;
              _buttonColor = Colors.deepOrange;
              _buttonText = "Reset";
            }
          });
        },
      ),
    );
  }
}

///Model Class
///Make sure the keys here are same as that in
///the response
class Demo {
  int userId;
  int id;
  String title;
  String body;

  Demo({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  ///This method is to deserialize your JSON
  ///Basically converting a string response to an object model
  ///Here key is always a String type and value can be of any type
  ///so we create a map of String and dynamic.
  factory Demo.fromJson(Map<String, dynamic> json) {
    return Demo(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}

///Used to map JSON data fetched from the server
Demo responseFromJson(String jsonStr) {
  final jsonData = json.decode(jsonStr);
  return Demo.fromJson(jsonData);
}

Future<Demo> getDemoResponse(String url) async {
  final response = await http.get(url);
  return responseFromJson(response.body);
}
