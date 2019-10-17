import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
//            Stack(
//              children: <Widget>[
//                Center(child: CircularProgressIndicator()),
//                Center(
//                  child: FadeInImage.memoryNetwork(
//                    placeholder: kTransparentImage,
//                    image: 'https://picsum.photos/250?image=9',
//                  ),
//                ),
//              ],
//           ),
//        Image(
//                image: CachedNetworkImageProvider(
//                    'https://picsum.photos/250?image=9')),
            Center(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/gifs/Wedges-3s-50px.gif',
                image: 'https://picsum.photos/250?image=9',
                fadeInCurve: Curves.bounceIn,
              ),
            ),

            ///In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline.
            Center(
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/250?image=9',
                placeholder: (context, url) {
                  //return CircularProgressIndicator();
                  return Image.asset('assets/gifs/Wedges-3s-50px.gif');
                },
                errorWidget: (context, url, error) => Column(
                  children: <Widget>[Icon(Icons.error), Text(error)],
                ),
                fadeInCurve: Curves.bounceIn,
              ),
            ),
//
          ],
        ),
      ),
    );
  }
}
