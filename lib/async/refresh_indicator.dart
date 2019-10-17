import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SwipeToRefresh extends StatefulWidget {
  @override
  _SwipeToRefreshState createState() => _SwipeToRefreshState();
}

class _SwipeToRefreshState extends State<SwipeToRefresh> {
  User user = User("Default User",
      "https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg");

  final GlobalKey<RefreshIndicatorState> _key =
      new GlobalKey<RefreshIndicatorState>();

  ///_refresh() method : this method call getUser() which returns User on future. When user is returned by getUser(), our user(of state) is updated & setState is called for rebuild.
  Future<Null> _refresh() async {
    return await getUser().then((_user) {
      setState(() {
        user = _user;
      });
    });
  }

  ///One thing missing here is user needs to swipe to see data at start, we can make data load automatically at start by updating indicator state inside initState once widget is build.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _key.currentState.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refresh Indicator"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              _key.currentState.show();
            },
          )
        ],
      ),
      body: RefreshIndicator(
        key: _key,
        onRefresh: _refresh,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      user.image,
                      height: 256.0,
                      width: 256.0,
                    ),
                    Spacer(),
                    Text(user.name),
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

class User {
  final String name, image;

  User(this.name, this.image);

  factory User.fromJson(Map<String, dynamic> json) {
    json = json['results'][0];
    String name = json['name']['first'] + " " + json['name']['last'];
    String image = json['picture']['large'];
    return User(name, image);
  }
}

Future<User> getUser() async {
  final response = await http.get("https://randomuser.me/api/");
  final responseJson = json.decode(response.body);
  return User.fromJson(responseJson);
}
