import 'package:flutter/material.dart';

import 'package:urbetrack_flutter_challenge/utils/colors.dart';

class AppThemes {
  static final ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    accentColor: AppColors.accentColor,
    scaffoldBackgroundColor: Colors.black,
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          // color: Colors.white,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(),
      border: OutlineInputBorder(),
    ),
    buttonColor: AppColors.accentColor,
    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.all(16),
      height: 56,
      shape: StadiumBorder(),
      // textTheme: ButtonTextTheme.primary,
    ),
    toggleableActiveColor: Colors.white,
  );

  static final ThemeData light = ThemeData(
    primaryColor: Colors.white,
    accentColor: AppColors.accentColor,
    scaffoldBackgroundColor: Colors.white,
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(),
      border: OutlineInputBorder(),
    ),
    buttonColor: AppColors.accentColor,
    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.all(16),
      height: 56,
      shape: StadiumBorder(),
      textTheme: ButtonTextTheme.primary,
    ),
    toggleableActiveColor: Colors.black,
  );
}
