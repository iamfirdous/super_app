import 'package:flutter/material.dart';
import 'package:super_app/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'ProductSans'
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => Router.generateRoute(settings),
    );
  }
}
