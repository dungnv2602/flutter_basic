import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData get themeData => _themeData;

  set themeData(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Dark Theme'),
              onPressed: () {
                _themeChanger.themeData = ThemeData.dark();
              },
            ),
            FlatButton(
              child: Text('Light Theme'),
              onPressed: () {
                _themeChanger.themeData = ThemeData.light();
              },
            )
          ],
        ),
      ),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: HomePage(),
      theme: theme._themeData,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (context) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

void main() => runApp(MyApp());
