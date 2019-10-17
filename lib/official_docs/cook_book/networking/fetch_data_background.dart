///However, you might need to perform an expensive computation, such as parsing a very large JSON document. If this work takes more than 16 milliseconds, your users experience jank.
///To avoid jank, you need to perform expensive computations like this in the background. On Android, this means scheduling work on a different thread. In Flutter, you can use a separate Isolate.
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///If you run the fetchPhotos() function on a slower device, you might notice the app freezes for a brief moment as it parses and converts the JSON. This is jank, and you want to be rid of it.
///You can remove the jank by moving the parsing and conversion to a background isolate using the compute() function provided by Flutter. The compute() function runs expensive functions in a background isolate and returns the result. In this case, run the parsePhotos() function in the background.

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
          future: fetchPhotos(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? PhotoList(photos: snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;

  const PhotoList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
      itemCount: photos.length,
    );
  }
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');

  /// Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}


class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        albumId: json['albumId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String,
      );
}
