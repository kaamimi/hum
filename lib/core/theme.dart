import 'package:flutter/material.dart';

const Color kPrimarySeedColor = Colors.green;
const Color kScaffoldBGColor = Color(0xFF161616);
const Color kAppBarBGColor = Color(0xFF161616);

final kMonthIndicatorColors = [
  Colors.redAccent, // January
  Colors.pinkAccent, // February
  Colors.deepPurpleAccent, // March
  Colors.purpleAccent, // April
  Colors.indigoAccent, // May
  Colors.blueAccent, // June
  Colors.lightBlueAccent, // July
  Colors.cyanAccent, // August
  Colors.tealAccent, // September
  Colors.greenAccent, // October
  Colors.amberAccent, // November
  Colors.orangeAccent, // December
];

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimarySeedColor,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: kScaffoldBGColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kAppBarBGColor,
    scrolledUnderElevation: 0,
  ),
);
