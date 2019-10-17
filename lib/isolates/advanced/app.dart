import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Isolate Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [];

  @override
  void initState() {
    super.initState();
    loadIsolate();
  }

  Future loadIsolate() async {
    ReceivePort receivePort = ReceivePort();

    await Isolate.spawn(isolateEntry, receivePort.sendPort);

    SendPort sendPort = await receivePort.first;

    List message = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/comments");

    setState(() => list = message);
  }

  static isolateEntry(SendPort sendPort) async {
    ReceivePort port = ReceivePort();

    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyPort = msg[1];

      String url = data;

      http.Response response = await http.get(url);

      replyPort.send(json.decode(response.body));
    }
  }

  Future sendReceive(SendPort send, message) {
    ReceivePort responsePort = ReceivePort();

    send.send([message, responsePort.sendPort]);
    return responsePort.first;
  }

  Widget loadData() {
    if (list.length == 0) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Item: ${list[index]["body"]}'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Isolate Example'),
      ),
      body: loadData(),
    );
  }
}
