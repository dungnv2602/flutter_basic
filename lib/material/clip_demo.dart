import 'package:flutter/material.dart';

class ClipSample extends StatelessWidget {
  static var _userAvatarUrl =
      'https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg';

  ///For example, by combining a ClipRect with an Align, one can show just the top half of an Image:
  var _clipRect = ClipRect(
    clipBehavior: Clip.none,
    child: Align(
      alignment: Alignment.topCenter,
      heightFactor: 0.5,
      child: Image.network(
        _userAvatarUrl,
        height: 256.0,
        width: 256.0,
      ),
    ),
  );
  var _clipRRect = ClipRRect(
    borderRadius: BorderRadius.circular(16.0),
    clipBehavior: Clip.hardEdge,
    child: Align(
      alignment: Alignment.topCenter,
      heightFactor: 0.5,
      child: Image.network(
        _userAvatarUrl,
        height: 256.0,
        width: 256.0,
      ),
    ),
  );
  var _clipOval = ClipOval(
    clipBehavior: Clip.antiAlias,
    child: Align(
      alignment: Alignment.topCenter,
      heightFactor: 0.5,
      child: Image.network(
        _userAvatarUrl,
        height: 256.0,
        width: 256.0,
      ),
    ),
  );
  var _clipPath = ClipPath(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Align(
      alignment: Alignment.topCenter,
      heightFactor: 0.5,
      child: Image.network(
        _userAvatarUrl,
        height: 256.0,
        width: 256.0,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _clipRRect,
      ),
    );
  }
}
