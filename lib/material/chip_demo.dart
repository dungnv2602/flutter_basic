import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  var _chip = Chip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: Text('AB'),
    ),
    label: Text('Aaron Burr'),
  );

  var _inputChip = InputChip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: Text('AB'),
    ),
    label: Text('Aaron Burr'),
    onPressed: () {
      print('On pressed!');
    },
    onDeleted: () {
      print('On deleted!');
    },
    onSelected: (bool value) {
      print('On selected! $value');
    },
  );

  var _actionChip = ActionChip(
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text('AB'),
      ),
      label: Text('Aaron Burr'),
      onPressed: () {
        print("If you stand for nothing, Burr, what’ll you fall for?");
      });

  @override
  Widget build(BuildContext context) {
    return _actionChip;
  }
}

class ChoiceChipWidget extends StatefulWidget {
  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        3,
        (int index) {
          return ChoiceChip(
            label: Text('Item $index'),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected1 = false;
  var _isSelected2 = false;
  var _isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        FilterChip(
          label: Text('chip 1'),
          labelStyle: TextStyle(color: Colors.white),
          selected: _isSelected1,
          backgroundColor: Colors.blueGrey,
          onSelected: (bool value) {
            setState(() {
              _isSelected1 = value;
            });
          },
          selectedColor: Colors.blue,
        ),
        FilterChip(
          label: Text('chip 2'),
          labelStyle: TextStyle(color: Colors.white),
          selected: _isSelected2,
          backgroundColor: Colors.blueAccent,
          onSelected: (bool value) {
            setState(() {
              _isSelected2 = value;
            });
          },
          selectedColor: Colors.blue,
        ),
        FilterChip(
          label: Text('chip 3'),
          labelStyle: TextStyle(color: Colors.white),
          selected: _isSelected3,
          backgroundColor: Colors.blue,
          onSelected: (bool value) {
            setState(() {
              _isSelected3 = value;
            });
          },
          selectedColor: Colors.blue,
        ),
        FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: () {
            /*...*/
          },
          child: Text(
            "Flat Button",
            style: TextStyle(fontSize: 20.0),
          ),
        )
      ],
    );
  }
}
