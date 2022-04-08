import 'package:flutter/material.dart';

class Styles {
  static const main = one;
  static const white = Colors.white;

  static const one = Color(0xFF26c6DA);
  static const two = Color(0xFF4DD0E1);
  static const three = Color(0xFF4FC3F7);
  static const four = Color(0xFF81D4FA);

  static const appBar = TextStyle(fontFamily: 'Baloo 2', color: Colors.white, fontSize: 14);

  static const eng = TextStyle(fontFamily: 'Baloo 2', color: Colors.black);
  static const mm = TextStyle(fontFamily: 'Pyidaungsu', color: Colors.black);

  static final text = TextTheme(
    bodyText1: eng,
    bodyText2: eng,
    button: eng,
    caption: eng,
    headline1: eng,
    headline2: eng,
    headline3: eng,
    headline4: eng,
    headline5: eng,
    headline6: eng.copyWith(color: Colors.white),
    overline: eng,
    subtitle1: eng,
    subtitle2: eng,
  );

  static final theme = ThemeData.light().copyWith(
    primaryColor: main,
    textTheme: text,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      primary: main,
      onPrimary: white,
      primaryVariant: main,
      secondary: main,
      onSecondary: main,
      secondaryVariant: main,
      surface: main,
      onSurface: main,
      background: main,
      onBackground: main,
      error: Colors.red,
      onError: Colors.red,
      brightness: Brightness.light,
    ),
  );
}
