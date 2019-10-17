import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareSample extends StatefulWidget {
  @override
  _FlareSampleState createState() => _FlareSampleState();
}

class _FlareSampleState extends State<FlareSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: FlareActor(
            'assets/animations/solar.flr',
            ///solar_run is the name of our animation, we can find in our animation editor of 2Dimension
            animation: 'solar_run',
          ),
        ),
      ),
    );
  }
}
