import 'dart:math';
import 'package:flutter/material.dart';
import 'package:super_app/ui/components/custom_app_bar.dart';

const ROUTE_DICE = '/dice';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 5;
  int rightDice = 3;

  void rollDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  Widget getDice(bool isLeft) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: rollDice,
          child: Image.asset('assets/images/dice${ isLeft ? leftDice : rightDice }.png'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: CustomAppBar(titleText: 'Dicee'),
      body: Center(
        child: Row(
          children: <Widget>[
            getDice(true),
            getDice(false),
          ],
        ),
      ),
    );
  }
}
