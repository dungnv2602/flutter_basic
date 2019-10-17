import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'injector.dart';
import 'model.dart';

void main() {
  Injector.config(RepoType.PROD);
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  final Injector injector;

  HomePage({Key key})
      : injector = Injector(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: FutureBuilder<List<Photo>>(
        future: injector.photoRepo.fetchPhotos(http.Client()),
        builder: (_, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PhotoGrid(
                  photos: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class PhotoGrid extends StatelessWidget {
  final List<Photo> photos;

  const PhotoGrid({Key key, @required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (_, index) => CachedNetworkImage(
        imageUrl: photos[index].url,
        fit: BoxFit.cover,
      ),
    );
  }
}
