import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class ProdRepo extends PhotoRepo {
  @override
  Future<List<Photo>> fetchPhotos(http.Client client) async {
    return compute(createPhotos, 100);
  }
}

List<Photo> createPhotos(int x) {
  return List.generate(
    x,
    (int i) => Photo(
      id: i,
      title: 'example $i',
      url: 'https://placeimg.com/640/480/tech/$i',
    ),
  );
}

class MockRepo extends PhotoRepo {
  static const URL = 'https://jsonplaceholder.typicode.com/photos';

  @override
  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response = await client.get(URL);
    return compute(parseJson, response.body);
  }
}

List<Photo> parseJson(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

abstract class PhotoRepo {
  Future<List<Photo>> fetchPhotos(http.Client client);
}
