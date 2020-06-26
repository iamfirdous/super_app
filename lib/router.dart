import 'package:flutter/material.dart';
import 'package:super_app/ui/pages/about_dev.dart';
import 'package:super_app/ui/pages/calculator.dart';
import 'package:super_app/ui/pages/dice.dart';
import 'package:super_app/ui/pages/home.dart';
import 'package:super_app/ui/pages/magic_8_ball.dart';
import 'package:super_app/ui/pages/play_ground.dart';
import 'package:super_app/ui/pages/quiz.dart';
import 'package:super_app/ui/pages/random_words.dart';
import 'package:super_app/ui/pages/xylophone.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => HomePage());
      case ROUTE_RANDOM_WORDS:
        return MaterialPageRoute(builder: (_) => RandomWordsPage());
      case ROUTE_CALCULATOR:
        return MaterialPageRoute(builder: (_) => CalculatorPage());
      case ROUTE_PLAY_GROUND:
        return MaterialPageRoute(builder: (_) => PlayGroundPage());
      case ROUTE_DICE:
        return MaterialPageRoute(builder: (_) => DicePage());
      case ROUTE_MAGIC_8_BALL:
        return MaterialPageRoute(builder: (_) => Magic8BallPage());
      case ROUTE_XYLOPHONE:
        return MaterialPageRoute(builder: (_) => XylophonePage());
      case ROUTE_QUIZ_PAGE:
        return MaterialPageRoute(builder: (_) => QuizPage());
      case ROUTE_ABOUT_DEV:
        return MaterialPageRoute(builder: (_) => AboutDevPage());
      default:
        return _errorScreen();
    }
  }

  static Route<dynamic> _errorScreen() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Oops!'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
