import 'package:flutter/material.dart';

class AllSlivers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverOverlapAbsorber(),
        SliverOverlapInjector(),
        SliverSafeArea(),
        SliverLayoutBuilder(),
        SliverIgnorePointer(),
        SliverPadding(),
        SliverOpacity(),
        SliverAppBar(),
        SliverPersistentHeader(),
        SliverToBoxAdapter(),
        SliverFillViewport(),
        SliverFillRemaining(),
        SliverAnimatedList(),
        SliverList(),
        SliverFixedExtentList(),
        SliverPrototypeExtentList(),
        SliverGrid(),
      ],
    );
  }
}
