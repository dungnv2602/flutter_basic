import 'dart:math';

import 'package:flutter/material.dart';

class AbsorbPointerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AbsorbPointer(
        /// control absorb on or off
        absorbing: false,
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: null,
                child: Text('button01'),
                color: Colors.primaries[
                    Random().nextInt(10) % Colors.primaries.length],
              ),
              RaisedButton(
                onPressed: null,
                child: Text('button02'),
                color: Colors.primaries[
                    Random().nextInt(1000) % Colors.primaries.length],
              ),
              RaisedButton(
                onPressed: null,
                child: Text('button03'),
                color: Colors.primaries[
                    Random().nextInt(1000) % Colors.primaries.length],
              ),
              RaisedButton(
                onPressed: null,
                child: Text('button04'),
                color: Colors.primaries[
                    Random().nextInt(1000) % Colors.primaries.length],
              ),
              RaisedButton(
                onPressed: null,
                child: Text('button05'),
                color: Colors.primaries[
                    Random().nextInt(1000) % Colors.primaries.length],
              ),
              RaisedButton(
                onPressed: null,
                child: Text('button06'),
                color: Colors.primaries[
                    Random().nextInt(1000) % Colors.primaries.length],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
