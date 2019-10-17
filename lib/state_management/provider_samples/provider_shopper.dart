import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

/// BEGIN: MODEL
const _itemNames = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

@immutable
class Item {
  final int id;
  final String name;

  Item(this.id) : name = _itemNames[id % _itemNames.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Item && other.id == id;
}

class CartModel with ChangeNotifier {
  /// Internal, private state of the cart
  final List<Item> _items = [];

  /// An unmodifiable view of the items in the cart
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// The current total price of all items
  int get totalPrice => _items.length * 42;

  /// Add [item] to cart. This is the only way t modify the cart from outside
  void add(Item item) {
    _items.add(item);

    /// This call tells the widgets that are listening to this model to update
    notifyListeners();
  }
}

/// END: MODEL
/// BEGIN: SCREENS
/// BEGIN: LOGIN SCREENS
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.display4,
              ),
              SizedBox(
                height: 24.0,
              ),
              _LoginTextField(
                hintText: 'Login',
              ),
              SizedBox(
                height: 12.0,
              ),
              _LoginTextField(
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 24.0,
              ),
              FlatButton(
                color: Colors.yellow,
                child: Text('ENTER'),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/catalog'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  const _LoginTextField(
      {Key key, @required this.hintText, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(hintText: hintText, fillColor: Colors.black12),
      obscureText: obscureText,
    );
  }
}

/// END: LOGIN SCREENS
/// BEGIN: CART SCREENS
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.display4,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: _CartList(),
              ),
            ),
            Divider(
              color: Colors.black54,
              height: 4.0,
            ),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.title;
    final cartItems = Provider.of<CartModel>(context).items;
    return ListView(
      children: <Widget>[
        for (var item in cartItems) Text('· ${item.name}', style: textTheme),
      ],
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme =
        Theme.of(context).textTheme.display4.copyWith(fontSize: 48.0);
    return SizedBox(
      height: 200.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CartModel>(
              builder: (context, cart, child) => Text(
                    '\$${cart.totalPrice}',
                    style: textTheme,
                  ),
            ),
            SizedBox(
              width: 24.0,
            ),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not supported yet.')));
              },
              color: Colors.white,
              child: Text('BUY'),
            )
          ],
        ),
      ),
    );
  }
}

/// END: CART SCREENS
/// BEGIN: CATALOG SCREENS
class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _MyAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)),
          )
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Catalog',
        style: Theme.of(context).textTheme.display4,
      ),
      floating: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        )
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
      onPressed: () => cart.items.contains(item) ? null : cart.add(item),
      splashColor: Theme.of(context).primaryColor,
      child: cart.items.contains(item)
          ? Icon(
              Icons.check,
              semanticLabel: 'ADDED',
            )
          : Text('ADD'),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index) : super(key: ValueKey(index));

  @override
  Widget build(BuildContext context) {
    var item = Item(index);
    var textTheme = Theme.of(context).textTheme.title;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: LimitedBox(
        maxHeight: 48.0,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            ),
            SizedBox(width: 14.0),
            Expanded(
              child: Text(
                item.name,
                style: textTheme,
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            _AddButton(
              item: item,
            )
          ],
        ),
      ),
    );
  }
}

/// END: CATALOG SCREENS
/// END: SCREENS

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: TextTheme(
            display4: TextStyle(
              fontFamily: 'Corben',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/catalog': (context) => CatalogScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
