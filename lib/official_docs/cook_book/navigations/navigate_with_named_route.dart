import 'package:flutter/material.dart';
import 'package:flutter_basic/official_docs/cook_book/animation/route_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: FirstScreen.routeName,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        FirstScreen.routeName: (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        SecondScreen.routeName: (context) => SecondScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case FirstScreen.routeName:
            return ScaleRoute(FirstScreen());
          case SecondScreen.routeName:
            final args = settings.arguments;
            return ScaleRoute(SecondScreen(args: args));
          default:
            return ScaleRoute(Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ));
        }
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () async {
            // Navigate to the second screen using a named route.
            final result =
                await Navigator.pushNamed(context, SecondScreen.routeName,
                    arguments: ScreenArguments(
                      'Extract Arguments Screen',
                      'This message is extracted in the build method.',
                    ));
            // After the Selection Screen returns a result, hide any previous SnackBars and show the new result.
            Scaffold.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('$result')));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  static const routeName = '/second';
  final ScreenArguments args;

  const SecondScreen({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args._title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route off the stack.
            Navigator.pop(context, 'A result from second screen!');
          },
          child: Text(args._message),
        ),
      ),
    );
  }
}

// You can pass any object to the arguments parameter.
// In this example, create a class that contains a customizable
// title and message.
class ScreenArguments {
  final String _title;
  final String _message;

  ScreenArguments(this._title, this._message);
}
