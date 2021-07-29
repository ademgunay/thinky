import 'package:flutter/material.dart';

const int DEFAULT_BUTTON_WIDTH = 220;
const int DEFAULT_BUTTON_HEIGHT = 48;

const KEY_IS_LIGHT_THEME = "KEY_IS_LIGHT_THEME";

final ThemeData appDarkTheme = ThemeData.dark().copyWith(
  inputDecorationTheme: InputDecorationTheme(
    focusColor: Colors.purple,
    focusedBorder:
    OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
  ),
);
final ThemeData appLightTheme = ThemeData.light().copyWith(
  inputDecorationTheme: InputDecorationTheme(
    focusColor: Colors.purple,
    focusedBorder:
    OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
  ),
);