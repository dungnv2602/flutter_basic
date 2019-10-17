import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class AnimatedListSample extends StatefulWidget {
  @override
  AnimatedListSampleState createState() {
    return AnimatedListSampleState();
  }
}

class AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<String> _data = [
    WordPair.random().toString(),
    WordPair.random().toString(),
    WordPair.random().toString(),
    WordPair.random().toString(),
    WordPair.random().toString(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Animated List'),
        backgroundColor: Colors.blueAccent,
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          child: Text(
            'Add an item',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          onPressed: () {
            _addAnItem();
          },
        ),
        RaisedButton(
          child: Text(
            'Remove last',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          onPressed: () {
            _removeLastItem();
          },
        ),
        RaisedButton(
          child: Text(
            'Remove all',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          onPressed: () {
            _removeAllItems();
          },
        ),
      ],
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _data.length,
        itemBuilder: (context, index, animation) =>
            _buildItem(context, _data[index], animation),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, String item, Animation<double> animation) {
    TextStyle textStyle = TextStyle(fontSize: 20);

    ///AlignTransition AnimatedBuilder AnimatedModalBarrier DecoratedBoxTransition DefaultTextStyleTransition PositionedTransition RelativePositionedTransition RotationTransition ScaleTransition SizeTransition SlideTransition
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: SizedBox(
          height: 50.0,
          child: Card(
            child: Center(
              child: Text(item, style: textStyle),
            ),
          ),
        ),
      ),
    );
  }

  void _addAnItem() {
    _data.insert(0, WordPair.random().toString());
    _listKey.currentState.insertItem(0);
  }

  void _removeLastItem() {
    String itemToRemove = _data[0];

    _listKey.currentState.removeItem(
      0,
      (BuildContext context, Animation<double> animation) =>
          _buildItem(context, itemToRemove, animation),
      duration: const Duration(milliseconds: 250),
    );

    _data.removeAt(0);
  }

  void _removeAllItems() {
    final int itemCount = _data.length;

    for (var i = 0; i < itemCount; i++) {
      String itemToRemove = _data[0];
      _listKey.currentState.removeItem(
        0,
        (BuildContext context, Animation<double> animation) =>
            _buildItem(context, itemToRemove, animation),
        duration: const Duration(milliseconds: 250),
      );

      _data.removeAt(0);
    }
  }
}
