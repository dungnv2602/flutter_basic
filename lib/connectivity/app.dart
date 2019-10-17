import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityResult>(
      builder: (context) => Connectivity().onConnectivityChanged,
      child: Scaffold(
        body: Center(
          child: NetworkSensitive(
              child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          )),
        ),
      ),
    );
  }
}

class NetworkSensitive extends StatelessWidget {
  final Widget child;

  const NetworkSensitive({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectivity = Provider.of<ConnectivityResult>(context);
    double opacity;
    switch (connectivity) {
      case ConnectivityResult.mobile:
        opacity = 0.5;
        break;
      case ConnectivityResult.wifi:
        opacity = 1;
        break;
      default:
        opacity = 0.1;
        break;
    }
    return Opacity(
      opacity: opacity,
      child: child,
    );
  }
}
