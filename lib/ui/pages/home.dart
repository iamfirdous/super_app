import 'package:flutter/material.dart';

import 'package:super_app/ui/components/custom_app_bar.dart';
import 'package:super_app/ui/pages/quiz.dart';
import 'package:super_app/ui/pages/about_dev.dart';
import 'package:super_app/ui/pages/calculator.dart';
import 'package:super_app/ui/pages/dice.dart';
import 'package:super_app/ui/pages/play_ground.dart';
import 'package:super_app/ui/pages/random_words.dart';
import 'package:super_app/ui/pages/magic_8_ball.dart';
import 'package:super_app/ui/pages/xylophone.dart';

const ROUTE_HOME = '/';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget _getGridTile({
    @required String imageName,
    @required String text,
    @required Function onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.4 , color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(
                imageName,
                width: 38.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(titleText: 'Super App'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            padding: const EdgeInsets.all(12),
            children: <Widget>[
              _getGridTile(
                imageName: 'assets/images/startup-name.png',
                text: 'Startup Name Generator',
                onTap: () =>
                    Navigator.of(context).pushNamed(ROUTE_RANDOM_WORDS),
              ),
              _getGridTile(
                imageName: 'assets/images/magic-calculator.png',
                text: 'Magic Calculator',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_CALCULATOR),
              ),
              _getGridTile(
                imageName: 'assets/images/super-icon.png',
                text: 'Play Ground',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_PLAY_GROUND),
              ),
              _getGridTile(
                imageName: 'assets/images/dice.png',
                text: 'Dicee',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_DICE),
              ),
              _getGridTile(
                imageName: 'assets/images/magic-8-ball.png',
                text: 'Magic 8 Ball',
                onTap: () =>
                    Navigator.of(context).pushNamed(ROUTE_MAGIC_8_BALL),
              ),
              _getGridTile(
                imageName: 'assets/images/xylophone.png',
                text: 'Xylophone',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_XYLOPHONE),
              ),
              _getGridTile(
                imageName: 'assets/images/quiz.png',
                text: 'Quizzler',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_QUIZ_PAGE),
              ),
              _getGridTile(
                imageName: 'assets/images/dev-icon.png',
                text: 'About Developer',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_ABOUT_DEV),
              ),
            ],
          );
        },
      ),
    );
  }
}
