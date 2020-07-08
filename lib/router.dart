import 'package:flutter/material.dart';
import 'package:super_app/models/bmi.dart';
import 'package:super_app/ui/pages/about_dev.dart';
import 'package:super_app/ui/pages/bmi_calculator.dart';
import 'package:super_app/ui/pages/bmi_result.dart';
import 'package:super_app/ui/pages/calculator.dart';
import 'package:super_app/ui/pages/calculator_secret.dart';
import 'package:super_app/ui/pages/destini.dart';
import 'package:super_app/ui/pages/dice.dart';
import 'package:super_app/ui/pages/home.dart';
import 'package:super_app/ui/pages/magic_8_ball.dart';
import 'package:super_app/ui/pages/play_ground.dart';
import 'package:super_app/ui/pages/quiz.dart';
import 'package:super_app/ui/pages/random_words.dart';
import 'package:super_app/ui/pages/xylophone.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic> args = settings.arguments;

    switch (settings.name) {
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => HomePage());
      case ROUTE_RANDOM_WORDS:
        return MaterialPageRoute(builder: (_) => RandomWordsPage());
      case ROUTE_CALCULATOR:
        return MaterialPageRoute(builder: (_) => CalculatorPage());
      case ROUTE_CALCULATOR_SECRET:
        return MaterialPageRoute(builder: (_) => CalculatorSecretPage());
      case ROUTE_PLAY_GROUND:
        return MaterialPageRoute(builder: (_) => PlayGroundPage());
      case ROUTE_DICE:
        return MaterialPageRoute(builder: (_) => DicePage());
      case ROUTE_MAGIC_8_BALL:
        return MaterialPageRoute(builder: (_) => Magic8BallPage());
      case ROUTE_XYLOPHONE:
        return MaterialPageRoute(builder: (_) => XylophonePage());
      case ROUTE_QUIZZLER:
        return MaterialPageRoute(builder: (_) => QuizPage());
      case ROUTE_DESTINI:
        return MaterialPageRoute(builder: (_) => DestiniPage());
      case ROUTE_BMI_CALCULATOR:
        return MaterialPageRoute(builder: (_) => BMICalculatorPage());
      case ROUTE_BMI_RESULT:
        final BMI bmi = args['bmi'] as BMI;
        return MaterialPageRoute(builder: (_) => BMIResultPage(bmi: bmi));
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
