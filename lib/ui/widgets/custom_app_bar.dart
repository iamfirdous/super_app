import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String titleText;
  final List<Widget> actions;

  CustomAppBar({this.titleText, this.actions}) : super(
    backgroundColor: Colors.black,
    brightness: Brightness.dark,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    title: Text(
      titleText,
      style: TextStyle(color: Colors.white),
    ),
    actions: actions
  );
}