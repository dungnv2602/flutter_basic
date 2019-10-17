import 'package:flutter/material.dart';

class BottomNavigationBarPageView extends StatefulWidget {
  @override
  _BottomNavigationBarPageViewState createState() => _BottomNavigationBarPageViewState();
}

class _BottomNavigationBarPageViewState extends State<BottomNavigationBarPageView> {
  int _currentIndex = 0;

  /// Page controller for the PageView
  final _pageController = PageController(initialPage: 0, keepPage: true);
  final _scrollDirection = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          FirstPage(
            key: PageStorageKey('Page1'),
          ),
          SecondPage(
            key: PageStorageKey('Page2'),
          ),
        ],
        controller: _pageController,
        scrollDirection: _scrollDirection,
        physics: PageScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) =>
            _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), title: Text('First Page')),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), title: Text('Second Page')),
        ],
      ),
    );
  }
}

class BottomNavigationBarIndexedStack extends StatefulWidget {
  @override
  _BottomNavigationBarIndexedStackState createState() => _BottomNavigationBarIndexedStackState();
}

class _BottomNavigationBarIndexedStackState extends State<BottomNavigationBarIndexedStack> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          FirstPage(
            key: PageStorageKey('Page1'),
          ),
          SecondPage(
            key: PageStorageKey('Page2'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), title: Text('First Page')),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), title: Text('Second Page')),
        ],
      ),
    );
  }
}

class BottomNavigationBarPageStorage extends StatefulWidget {
  @override
  _BottomNavigationBarPageStorageState createState() => _BottomNavigationBarPageStorageState();
}

class _BottomNavigationBarPageStorageState extends State<BottomNavigationBarPageStorage> {
  final List<Widget> pages = [
    FirstPage(
      key: PageStorageKey('Page1'),
    ),
    SecondPage(
      key: PageStorageKey('Page2'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: pages[_currentIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), title: Text('First Page')),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), title: Text('Second Page')),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal,
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Card(
                color: Colors.amber,
                child: ListTile(
                  title: const Text('Lprem Ipsum'),
                  trailing: Text('$index'),
                ),
              )),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.amber,
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Card(
                color: Colors.teal,
                child: ListTile(
                  title: const Text('Lprem Ipsum'),
                  trailing: Text('$index'),
                ),
              )),
    );
  }
}
