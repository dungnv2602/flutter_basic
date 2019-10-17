import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;

class PhotoHero extends StatelessWidget {
  final String photo;
  final double width;
  final VoidCallback onTap;

  const PhotoHero({Key key, this.photo, this.width, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///The SizedBox specifies the hero’s size at the start and end of the animation.
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,

          ///Defining the Material widget with a transparent color enables the image to “pop out” of the background as it flies to its destination.
          ///Provides a canvas for the InkWell's splash during Hero's flight. Otherwise, the splash would be left behind.
          child: Material(
            color: Colors.transparent,

            ///An InkWell wraps the image, making it trivial to add a tap gesture to the both the source and destination heroes.
            ///Captures the tap gesture, and draws its splash on its first Material ancestor.
            child: InkWell(
              onTap: onTap,

              ///Obtain its width from SizedBox. Chooses its height to preserve the image's aspect ratio.
              child: Image.asset(
                photo,

                ///Setting the Image’s fit property to BoxFit.contain, ensures that the image is as large as possible during the transition without changing its aspect ratio.
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 1.0 means normal animation speed.
    timeDilation = 1.0; //slow down for debugging

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation.'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'assets/icons/lake.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Next Page'),
                ),
                body: Container(
                  color: Colors.lightBlueAccent,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                      photo: 'assets/icons/lake.jpg',
                      width: 100.0,
                      onTap: () {
                        Navigator.of(context).pop();
                      }),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

///Radial hero animations
class Photo extends StatelessWidget {
  Photo({ Key key, this.photo, this.color, this.onTap }) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return Image.asset(
              photo,
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder<void>(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget child) {
                          return Opacity(
                            opacity: opacityCurve.transform(animation.value),
                            child: _buildPage(context, imageName, description),
                          );
                        }
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 15.0; // 1.0 is normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Transition Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(context, 'assets/icons/image1.jpeg', 'img-01'),
            _buildHero(context, 'assets/icons/image2.jpeg', 'img-02'),
            _buildHero(context, 'assets/icons/image3.jpeg', 'img-03'),
          ],
        ),
      ),
    );
  }
}

class RadialAnimatedExpansion extends StatelessWidget {
  RadialAnimatedExpansion({
    Key key,
    this.minRadius,
    this.maxRadius,
    this.child,
  }) : clipTween = Tween<double>(
    begin: 2.0 * minRadius,
    end: 2.0 * (maxRadius / math.sqrt2),
  ),
        super(key: key);

  final double minRadius;
  final double maxRadius;
  final Tween<double> clipTween;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints size) {
        final double t = (size.biggest.width / 2.0 - minRadius) / (maxRadius - minRadius);
        final double rectClipExtent = clipTween.transform(t);
        return ClipOval(
          child: Center(
            child: SizedBox(
              width: rectClipExtent,
              height: rectClipExtent,
              child: ClipRect(
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class RadialAnimatedExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialAnimatedExpansion(
                    minRadius: kMinRadius,
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialAnimatedExpansion(
          minRadius: kMinRadius,
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder<void>(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget child) {
                          return Opacity(
                            opacity: opacityCurve.transform(animation.value),
                            child: _buildPage(context, imageName, description),
                          );
                        }
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 is normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Transition Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(context, 'assets/icons/image1.jpeg', 'img-01'),
            _buildHero(context, 'assets/icons/image2.jpeg', 'img-02'),
            _buildHero(context, 'assets/icons/image3.jpeg', 'img-03'),
          ],
        ),
      ),
    );
  }
}

main() => runApp(MaterialApp(home: RadialAnimatedExpansionDemo()));
