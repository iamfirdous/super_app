import 'package:flutter/material.dart';
import 'package:super_app/router.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super App',
      theme: ThemeData(primaryColor: Colors.white, fontFamily: 'ProductSans'),
      initialRoute: '/',
      onGenerateRoute: (settings) => Router.generateRoute(settings),
    );
  }
}
