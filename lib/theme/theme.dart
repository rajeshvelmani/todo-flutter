import 'package:flutter/material.dart';

const _blackPrimaryValue = 0xFF000000;

const _whitePrimaryValue = 0xFFe0e0e0;

const MaterialColor black = const MaterialColor(
  _blackPrimaryValue,
  const <int, Color>{
    50: const Color(0xFFe0e0e0),
    100: const Color(0xFFb3b3b3),
    200: const Color(0xFF808080),
    300: const Color(0xFF4d4d4d),
    400: const Color(0xFF262626),
    500: const Color(_blackPrimaryValue),
    600: const Color(0xFF000000),
    700: const Color(0xFF000000),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  },
);

const MaterialColor white = const MaterialColor(
  _whitePrimaryValue,
  const <int, Color>{
    50: const Color(0xFF262626),
    100: const Color(0xFF4d4d4d),
    200: const Color(0xFF808080),
    300: const Color(0xFFb3b3b3),
    400: const Color(0xFFb3b3b3),
    500: const Color(_whitePrimaryValue),
    600: const Color(0xFFffffff),
    700: const Color(0xFFffffff),
    800: const Color(0xFFffffff),
    900: const Color(0xFFffffff),
  },
);

ThemeData get lightTheme {
  return ThemeData(
    primarySwatch: black,
    accentColor: Colors.blueAccent,
    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
  );
}

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    primaryColor: white,
    scaffoldBackgroundColor: Colors.black,
    accentColor: Colors.blue,
    backgroundColor: Color.fromRGBO(50, 50, 50, 1),
  );
}
