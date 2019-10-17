import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StreamSample extends StatelessWidget {
  static final Stream myStream = NumberCreator().stream;

  final StreamSubscription subscription = myStream.listen(
    (data) {
      print('Data: $data');
    },
    onDone: () {
      print('all done');
    },
    onError: (error) {
      print('Error $error');
    },
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: NumberCreator().stream.map((i) => 'String $i'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {}
          if (snapshot.connectionState == ConnectionState.active) {}
          if (snapshot.connectionState == ConnectionState.waiting) {}
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {}
            if (snapshot.hasData) {}
          }
        });
  }
}

class NumberCreator {
  final _controller = StreamController<int>();
  var _count = 1;

  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink.add(_count);
      _count++;
    });
  }

  Stream<int> get stream => _controller.stream;
}
