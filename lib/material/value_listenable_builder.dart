import 'package:flutter/material.dart';

class ValueListenableBuilderSample extends StatefulWidget {
  @override
  _ValueListenableBuilderSampleState createState() =>
      _ValueListenableBuilderSampleState();
}

class _ValueListenableBuilderSampleState
    extends State<ValueListenableBuilderSample> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final Widget goodJob = const Text('Good job!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: goodJob,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            ValueListenableBuilder(
              builder: (BuildContext context, int value, Widget child) {
                /// This builder will only get called when the _counter is updated
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[Text('$value'), child],
                );
              },
              valueListenable: _counter,

              /// The child parameter is most helpful if the child is expensive to build and does not depend on the value from the notifier.
              child: goodJob,
            )
          ],
        ),
      ),
    );
  }
}
