import 'package:flutter/material.dart';

class EphemeralStateSample extends StatefulWidget {
  @override
  _EphemeralStateSampleState createState() => _EphemeralStateSampleState();
}

class _EphemeralStateSampleState extends State<EphemeralStateSample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (newIndex) {
          setState(() {
            _index = newIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
      ),
    );
  }
}
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isLoved = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isLoved) {
        _favoriteCount -= 1;
        _isLoved = false;
      } else {
        _favoriteCount += 1;
        _isLoved = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
              icon: (_isLoved ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red.shade500,
              onPressed: _toggleFavorite),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}
