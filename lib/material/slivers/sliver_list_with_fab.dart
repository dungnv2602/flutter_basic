import 'package:flutter/material.dart';

class SliverListWithFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
            // Allows the user to reveal the app bar if they begin scrolling back up the list of items.
            //floating: true,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/icons/lake.jpg',
                fit: BoxFit.cover,
              ),
              title: const Text(
                'SliverList with FABar',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Ubuntu',
                    color: Colors.black),
              ),
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              titlePadding: EdgeInsets.only(bottom: 120.0),
            ),
            expandedHeight: 200,
            elevation: 8.0,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Add new entry',
                onPressed: () {
                  /**/
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('item $index'),
                );
              },
              childCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
