import 'package:flutter/material.dart';

ThemeData apptheme = ThemeData(
  appBarTheme: const AppBarTheme(
   
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
  ),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    bodyLarge: TextStyle(
      fontSize: 15,
      height: 2,
      color: Color.fromARGB(255, 141, 134, 134),
    ),
  ),
);
