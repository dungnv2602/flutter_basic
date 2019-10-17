import 'package:flutter/material.dart';
import 'dart:ui' show ImageFilter;

///This widget lets you animate the opacity of a widget. You have to provide its opacity parameter with animation and a child widget on which you want to perform the animation on. You may ask that can’t you can use AnimatedOpacity widget to perform animations with the opacity of a widget? The answer is Yes, of course, you can. The only thing you’ll lack there is that you won’t be able to control the animation behavior on the basis of the Animation state. That can only be done when you are working with explicit animations and AnimatedOpacity is an implicit one.

class FadeTransitionWidget extends StatefulWidget {
  @override
  _FadeTransitionWidgetState createState() => _FadeTransitionWidgetState();
}

class _FadeTransitionWidgetState extends State<FadeTransitionWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    ///An animation controller lets you control the
    ///duration of an animation
    ///Here the ticker for vsync provider is provided
    ///by the SingleTickerProviderStateMixin
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    ///Providing our animation with a curve (Parent here is the controller
    ///above)
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    ///Creating a Tween animation with start and end values for the
    ///opacity and providing it with our animation controller
    _animation = Tween(begin: 0.0, end: 1.0).animate(_curvedAnimation);

    ///Set a status listener to our animation to control the behaviour
    ///of our animation
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _controller.reverse();
      else if (status == AnimationStatus.dismissed) _controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: 300.0,
        width: 300.0,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: FadeTransition(
              ///Providing our animation to opacity property
              opacity: _animation,
              child: FlutterLogo(),
            ),
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          setState(() {
            ///We start the animation by calling this
            _controller.forward();
          });
        },
        label: Text('Animate', style: TextStyle(color: Colors.white)),
        icon: Icon(
          Icons.movie_filter,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageUrl = "image1.jpeg";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/$imageUrl"),
                  fit: BoxFit.cover,
                ),
              ),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: new Container(
                  decoration:
                  new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CardStack(
                    onCardChanged: (url) {
                      setState(() {
                        imageUrl = url;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardStack extends StatefulWidget {
  final Function onCardChanged;

  CardStack({this.onCardChanged});
  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack>
    with SingleTickerProviderStateMixin {
  var cards = [
    TouristCard(index: 0, imageUrl: "image1.jpeg"),
    TouristCard(index: 1, imageUrl: "image2.jpeg"),
    TouristCard(index: 2, imageUrl: "image3.jpeg"),
    TouristCard(index: 3, imageUrl: "image4.jpeg"),
    TouristCard(index: 4, imageUrl: "image1.jpeg"),
    TouristCard(index: 5, imageUrl: "image2.jpeg")
  ];
  int currentIndex;
  AnimationController controller;
  CurvedAnimation curvedAnimation;
  Animation<Offset> _translationAnim;
  Animation<Offset> _moveAnim;
  Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOut);

    _translationAnim = Tween(begin: Offset(0.0, 0.0), end: Offset(-1000.0, 0.0))
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });

    _scaleAnim = Tween(begin: 0.965, end: 1.0).animate(curvedAnimation);
    _moveAnim = Tween(begin: Offset(0.0, 0.05), end: Offset(0.0, 0.0))
        .animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          overflow: Overflow.visible,
          children: cards.reversed.map((card) {
            if (cards.indexOf(card) <= 2) {
              return GestureDetector(
                onHorizontalDragEnd: _horizontalDragEnd,
                child: Transform.translate(
                  offset: _getFlickTransformOffset(card),
                  child: FractionalTranslation(
                    translation: _getStackedCardOffset(card),
                    child: Transform.scale(
                      scale: _getStackedCardScale(card),
                      child: Center(child: card),
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          }).toList()),
    );
  }

  Offset _getStackedCardOffset(TouristCard card) {
    int diff = card.index - currentIndex;
    if (card.index == currentIndex + 1) {
      return _moveAnim.value;
    } else if (diff > 0 && diff <= 2) {
      return Offset(0.0, 0.05 * diff);
    } else {
      return Offset(0.0, 0.0);
    }
  }

  double _getStackedCardScale(TouristCard card) {
    int diff = card.index - currentIndex;
    if (card.index == currentIndex) {
      return 1.0;
    } else if (card.index == currentIndex + 1) {
      return _scaleAnim.value;
    } else {
      return (1 - (0.035 * diff.abs()));
    }
  }

  Offset _getFlickTransformOffset(TouristCard card) {
    if (card.index == currentIndex) {
      return _translationAnim.value;
    }
    return Offset(0.0, 0.0);
  }

  void _horizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity < 0) {
      // Swiped Right to Left
      controller.forward().whenComplete(() {
        setState(() {
          controller.reset();
          TouristCard removedCard = cards.removeAt(0);
          cards.add(removedCard);
          currentIndex = cards[0].index;
          if (widget.onCardChanged != null)
            widget.onCardChanged(cards[0].imageUrl);
        });
      });
    }
  }
}

class TouristCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  TouristCard({this.index, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    TextStyle cardTitleStyle =
    Theme.of(context).textTheme.title.copyWith(fontSize: 24.0);
    TextStyle cardSubtitleStyle = Theme.of(context)
        .textTheme
        .title
        .copyWith(fontSize: 20.0, color: Colors.grey);
    TextStyle cardButtonStyle = Theme.of(context)
        .textTheme
        .title
        .copyWith(fontSize: 16.0, color: Colors.white);

    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(children: [
          Image.asset("assets/icons/$imageUrl"),
          FractionalTranslation(
            translation: Offset(1.7, -0.5),
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.yellow,
              child: Icon(Icons.star),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Tourist Spot",
              style: cardTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Travel and Recreation",
              style: cardSubtitleStyle,
            ),
          ),
          RaisedButton(
            elevation: 2.0,
            color: Colors.blue,
            child: Text(
              "EXPLORE",
              style: cardButtonStyle,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}