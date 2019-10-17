import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class IsolateSample extends StatefulWidget {
  IsolateSample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<IsolateSample> {
  String welcome;

  static String getHello(String name) {
    return "Hello ${name}";
  }
  void _getHello(String name) async {
    /// use compute to run method in another Isolate
    String result = await compute(getHello, name);
    setState((){
      welcome=result;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return null;
  }
}