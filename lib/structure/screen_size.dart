import 'package:flutter/material.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height - reducedBy) / dividedBy;
}

double screenWidth(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).width - reducedBy) / dividedBy;
}

double screenHeightExcludingToolbar(BuildContext context,
    {double dividedBy = 1}) {
  return screenHeight(context, dividedBy: dividedBy, reducedBy: kToolbarHeight);
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen Height')),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Column(children: <Widget>[
              Container(
                color: Colors.blue[200],
                height: screenHeightExcludingToolbar(context, dividedBy: 2),
              ),
              Container(
                  color: Colors.yellow[200],
                  height: screenHeightExcludingToolbar(context, dividedBy: 3))
            ]),
          ),
          Container(
            width: 80.0,
            color: Colors.purple[300],
          )
        ],
      ),
    );
  }
}
