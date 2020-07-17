import 'package:flutter/material.dart';

import 'package:super_app/ui/pages/klymate.dart';
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
import 'package:super_app/util/constants.dart';

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
                imageName: '${Constants.IMAGES_PATH}startup-name.png',
                label: 'Startup Name Generator',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_RANDOM_WORDS),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}magic-calculator.png',
                label: 'Magic Calculator',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_CALCULATOR),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}super-icon.png',
                label: 'Play Ground',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_PLAY_GROUND),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}dice.png',
                label: 'Dicee',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_DICE),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}magic-8-ball.png',
                label: 'Magic 8 Ball',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_MAGIC_8_BALL),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}xylophone.png',
                label: 'Xylophone',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_XYLOPHONE),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}quiz.png',
                label: 'Quizzler',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_QUIZZLER),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}destini.png',
                label: 'Destini',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_DESTINI),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}bmi.png',
                label: 'BMI Calculator',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_BMI_CALCULATOR),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}klymate.png',
                label: 'Klymate',
                onTap: () => Navigator.of(context).pushNamed(ROUTE_KLYMATE),
              ),
              AppTile(
                imageName: '${Constants.IMAGES_PATH}dev-icon.png',
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
