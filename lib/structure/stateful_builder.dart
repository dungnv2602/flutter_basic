import 'package:flutter/material.dart';

class StateBuilderSample extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Luke Skywalker",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Age:  23",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Center(
                child: Container(
                  height: 130.0,
                  width: 130.0,
                  child: Image.asset("assets/icons/flowers.jpg"),
                ),
              ),
              SizedBox(height: 12.0),
              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.skip_previous),
                        onPressed: () {
                          setState(() {
                            counter--;
                          });
                        },
                      ),
                      Text(
                        '$counter',
                        style: Theme.of(context).textTheme.title,
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_next),
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
