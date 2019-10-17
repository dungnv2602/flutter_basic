import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void setImage(http.Response resp) {}

    final delay = Future<int>.delayed(Duration(seconds: 3), () {
      return 3;
    }).then((value) {
      return value;
    }).catchError((error) {
      print('Caught $error');
    }).whenComplete(() {
      print('All Completed!');
    });

    return Container(
      child: FutureBuilder<int>(
          future: delay,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {}
            if (snapshot.connectionState == ConnectionState.active) {}
            if (snapshot.connectionState == ConnectionState.waiting) {}
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {}
              if (snapshot.hasData) {}
            }
          }),
    );
  }
}
