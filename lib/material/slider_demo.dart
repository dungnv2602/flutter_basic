import 'package:flutter/material.dart';

class SliderWidget1 extends StatefulWidget {
  @override
  _SliderWidget1State createState() => _SliderWidget1State();
}

class _SliderWidget1State extends State<SliderWidget1> {
  var _myFeedbackText = 'TEXT';
  Color _myFeedbackColor = Colors.red;
  IconData _myFeedbackIcon = Icons.face;

  var _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Scale from 1 to 5',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Material(
                color: Colors.white,
                elevation: 8.0,
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  width: 300.0,
                  height: 400.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(_myFeedbackText),
                      Icon(_myFeedbackIcon,
                          color: _myFeedbackColor, size: 100.0),
                      Slider(
                        min: 0.0,
                        max: 5.0,
                        divisions: 5,
                        value: _sliderValue,
                        activeColor: Colors.redAccent,
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                            if (_sliderValue >= 0.0 && _sliderValue <= 1.0) {
                              _myFeedbackText = '1';
                              _myFeedbackColor = Colors.red.shade50;
                              _myFeedbackIcon = Icons.face;
                            }
                            if (_sliderValue >= 1.1 && _sliderValue <= 2.0) {
                              _myFeedbackText = '2';
                              _myFeedbackColor = Colors.red.shade100;
                              _myFeedbackIcon = Icons.add;
                            }
                            if (_sliderValue >= 2.1 && _sliderValue <= 3.0) {
                              _myFeedbackText = '3';
                              _myFeedbackColor = Colors.red.shade200;
                              _myFeedbackIcon = Icons.flight_land;
                            }
                            if (_sliderValue >= 3.1 && _sliderValue <= 4.0) {
                              _myFeedbackText = '4';
                              _myFeedbackColor = Colors.red.shade300;
                              _myFeedbackIcon = Icons.send;
                            }
                            if (_sliderValue >= 4.1 && _sliderValue <= 5.0) {
                              _myFeedbackText = '5';
                              _myFeedbackColor = Colors.red.shade400;
                              _myFeedbackIcon = Icons.work;
                            }
                          });
                        },
                      ),
                      Text('Your Rating: $_sliderValue')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget2 extends StatefulWidget {
  @override
  _SliderWidget2State createState() => _SliderWidget2State();
}

class _SliderWidget2State extends State<SliderWidget2> {
  Color positiveColor = new Color(0xFFEF0078);
  Color negativeColor = new Color(0xFFFFFFFF);
  double percentage = 0.0;

  double initial = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'CUSTOM SLIDER',
          style: TextStyle(color: positiveColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              percentage.round().toString() + ' %',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 70.0,
                color: positiveColor,
              ),
            ),
            GestureDetector(
              onPanStart: (DragStartDetails details) {
                initial = details.globalPosition.dx;
              },
              onPanUpdate: (DragUpdateDetails details) {
                double distance = details.globalPosition.dx - initial;
                double percentageAddition = distance / 200;

                print('distance ' + distance.toString());
                setState(() {
                  print('percentage ' +
                      (percentage + percentageAddition)
                          .clamp(0.0, 100.0)
                          .toString());
                  percentage =
                      (percentage + percentageAddition).clamp(0.0, 100.0);
                });
              },
              onPanEnd: (DragEndDetails details) {
                initial = 0.0;
              },
              child: Container(
                width: 200.0 + 4.0,
                height: 30.0,
                decoration: BoxDecoration(
                    color: negativeColor,
                    border: Border.all(color: Colors.black, width: 2.0)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      color: positiveColor,
                      width: (percentage / 100) * 200.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

