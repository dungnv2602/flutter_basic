import 'package:flutter/material.dart';

const kPrimaryColor = const Color(0xFF81c784);
const kPrimaryLight = const Color(0xFFb2fab4);
const kPrimaryDark = const Color(0xFF519657);
const kSecondaryColor = const Color(0xFF4dd0e1);
const kSecondaryLight = const Color(0xFF88ffff);
const kSecondaryDark = const Color(0xFF009faf);

ThemeData buildThemeData() {
  final baseTheme = ThemeData.light();
  return baseTheme.copyWith(
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryDark,
    primaryColorLight: kPrimaryLight,
    accentColor: kSecondaryColor,
    bottomAppBarColor: kSecondaryDark,
    buttonColor: kSecondaryColor,
    textTheme: TextTheme().copyWith(
      headline: TextStyle(
        fontFamily: "Ubuntu",
      ),
    ),
    primaryTextTheme: TextTheme(),
    accentTextTheme: TextTheme(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildThemeData(),
    );
  }
}