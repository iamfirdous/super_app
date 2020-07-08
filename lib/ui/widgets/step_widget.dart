import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_app/ui/widgets/round_icon_button.dart';

class StepWidget extends StatelessWidget {
  final String label;
  final int value;
  final Function onIncrement;
  final Function onDecrement;
  final Function increaseBy10;
  final Function decreaseBy10;

  const StepWidget({
    @required this.label,
    @required this.value,
    @required this.onIncrement,
    @required this.onDecrement,
    this.increaseBy10,
    this.decreaseBy10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label),
        Text(
          value.toString(),
          style: TextStyle(fontSize: 46.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onTap: onDecrement,
              onLongPress: decreaseBy10,
            ),
            SizedBox(width: 12.0),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onTap: onIncrement,
              onLongPress: increaseBy10,
            ),
          ],
        ),
      ],
    );
  }
}
