import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'colors.dart';

class MyStyles {
  static final ThemeData bmiTheme = ThemeData(
    primaryColor: MyColors.primary,
    accentColor: MyColors.accent,
    backgroundColor: MyColors.background,
    scaffoldBackgroundColor: MyColors.scaffold,
    fontFamily: 'ProductSans',
    textTheme: TextTheme(
      bodyText1: TextStyle(color: MyColors.accent),
      bodyText2: TextStyle(color: MyColors.accent),
    ),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: MyColors.accent),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: MyColors.accent,
          fontSize: 20.0,
          fontFamily: 'ProductSans',
        ),
      ),
    ),
  );

  static final AlertStyle alertStyle = AlertStyle(
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    isCloseButton: false,
  );
}
