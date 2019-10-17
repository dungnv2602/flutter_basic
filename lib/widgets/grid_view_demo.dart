import 'package:flutter/material.dart';

///Grids are pretty similar to Lists. The widget we use is a GridView.builder instead of a ListView.builder.
/// In a grid, the only fundamental difference is that it has multiple columns. So, a GridView also takes a gridDelegate which helps you set the number of columns.
/// The crossAxisCount inside the gridDelegate is the number of columns. This can also be changed according to orientation.
const androidVersionNames = <String>['Version01','Version02','Version03','Version04','Version05','Version06','Version07','Version08'];
class GridViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, position)=>Card(
          child: Text(androidVersionNames[position]),
        ),
      itemCount: androidVersionNames.length,
    );
  }
}
