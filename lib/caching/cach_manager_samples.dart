import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

const String url =
    'https://firebasestorage.googleapis.com/v0/b/filledstacks.appspot.com/o/filledstacks_tutorials.pdf?alt=media&token=a5e671e7-5acd-4bc4-a167-8d8483954d2a';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Downloading...';
  final customCache = CustomCacheManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
//          final fetched = await DefaultCacheManager().getSingleFile(url);
          final fetched = await customCache.getSingleFile(url);
          setState(() {
            title = 'fetched: ${fetched.path}';
          });
        },
      ),
      body: Center(child: Text(title)),
    );
  }
}

class CustomCacheManager extends BaseCacheManager {
  static const _key = 'pdfCache';
  final int maxFilesCache;
  final Duration cacheTimeout;

  CustomCacheManager({
    this.maxFilesCache = 10, // limit files cache to 10
    this.cacheTimeout = const Duration(seconds: 30), // limit exist time to 30s
  }) : super(
          _key,
          maxNrOfCacheObjects: maxFilesCache,
          maxAgeCacheObject: cacheTimeout,
        );

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return p.join(directory.path, _key);
  }
}
