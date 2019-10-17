import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///Although it’s convenient, it’s not recommended to put a call to an API in a build() method.
//
//Flutter calls the build() method every time it wants to change anything in the view, and this happens surprisingly often. If you leave the fetch call in your build() method, you’ll flood the API with unnecessary calls and slow down your app.

Future<Post> fetchPost() async {
  final response = await http.get(
    'https://jsonplaceholder.typicode.com/posts/1',
    // Send authorization headers to the backend.
    headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
  );
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception(
        'Failed to load post ${response.statusCode} - ${response.body}');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  @override
  String toString() {
    return '$userId - $id - $title - $body';
  }
}

class FetchDataNetworkStateful extends StatefulWidget {
  @override
  _FetchDataNetworkStatefulState createState() =>
      _FetchDataNetworkStatefulState();
}

class _FetchDataNetworkStatefulState extends State<FetchDataNetworkStateful> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}

class FetchDataNetworkStateless extends StatelessWidget {
  final Future<Post> post;

  FetchDataNetworkStateless({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
