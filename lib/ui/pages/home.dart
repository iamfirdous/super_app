import 'package:flutter/material.dart';
import 'package:super_app/ui/widgets/app_tile.dart';

import 'package:super_app/ui/widgets/custom_app_bar.dart';
import 'package:super_app/ui/pages/bmi_calculator.dart';
import 'package:super_app/ui/pages/destini.dart';
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
              AppTile(
                imageName: 'assets/images/startup-name.png',
                label: 'Startup Name Generator',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_RANDOM_WORDS),
              ),
              AppTile(
                imageName: 'assets/images/magic-calculator.png',
                label: 'Magic Calculator',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_CALCULATOR),
              ),
              AppTile(
                imageName: 'assets/images/super-icon.png',
                label: 'Play Ground',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_PLAY_GROUND),
              ),
              AppTile(
                imageName: 'assets/images/dice.png',
                label: 'Dicee',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_DICE),
              ),
              AppTile(
                imageName: 'assets/images/magic-8-ball.png',
                label: 'Magic 8 Ball',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_MAGIC_8_BALL),
              ),
              AppTile(
                imageName: 'assets/images/xylophone.png',
                label: 'Xylophone',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_XYLOPHONE),
              ),
              AppTile(
                imageName: 'assets/images/quiz.png',
                label: 'Quizzler',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_QUIZZLER),
              ),
              AppTile(
                imageName: 'assets/images/destini.png',
                label: 'Destini',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_DESTINI),
              ),
              AppTile(
                imageName: 'assets/images/bmi.png',
                label: 'BMI Calculator',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_BMI_CALCULATOR),
              ),
              AppTile(
                imageName: 'assets/images/dev-icon.png',
                label: 'About Developer',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_ABOUT_DEV),
              ),
            ],
          );
        },
      ),
    );
  }
}
