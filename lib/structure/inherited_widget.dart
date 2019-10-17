import 'package:flutter/material.dart';

void main() => runApp(StateContainer(user: null, child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please add user info',
              style: TextStyle(fontSize: 18.0, fontFamily: 'Roboto'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateUserScreen()));
        },
      ),
    );
  }
}

class UpdateUserScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> firstNameKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> lastNameKey =
      new GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> emailKey =
      new GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Info'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          autovalidate: false,
          child: new ListView(
            children: [
              new TextFormField(
                key: firstNameKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              new TextFormField(
                key: lastNameKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              new TextFormField(
                key: emailKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'Email Address',
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final form = formKey.currentState;
            if (form.validate()) {
              final firstName = firstNameKey.currentState.value;
              final lastName = lastNameKey.currentState.value;
              final email = emailKey.currentState.value;

              Navigator.pop(context);
            }
          }),
    );
  }
}

///In a real app, this could be a bigger class called AppState, where you’d hold all the properties you want to access across your app.
class User {
  String firstName;
  String lastName;
  String email;

  User(this.firstName, this.lastName, this.email);
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  // You must pass through a child and your state.
  const _InheritedStateContainer(
      {Key key, @required Widget child, @required this.data})
      : assert(child != null),
        super(key: key, child: child);

  static _InheritedStateContainer of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(_InheritedStateContainer)
        as _InheritedStateContainer;
  }

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) {
    return true;
  }
}

class StateContainer extends StatefulWidget {
  // You must pass through a child.
  final Widget child;
  final User user;

  const StateContainer({Key key, @required this.user, @required this.child})
      : super(key: key);

  // This is the secret sauce. Write your own 'of' method that will behave
  // Exactly like MediaQuery.of and Theme.of
  // It basically says 'get the data from the widget of this type.
  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  // Whichever properties you wanna pass around your app as state
  User user;

  // You can (and probably will) have methods on your StateContainer
  // These methods are then used through our your app to
  // change state.
  // Using setState() here tells Flutter to repaint all the
  // Widgets in the app that rely on the state you've changed.
  void updateUserInfo({firstName, lastName, email}) {
    if (user == null) {
      user = new User(firstName, lastName, email);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user.firstName = firstName ?? user.firstName;
        user.lastName = lastName ?? user.lastName;
        user.email = email ?? user.email;
      });
    }
  }

  // Simple build method that just passes this state through
  // your InheritedWidget
  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
