import 'package:flutter/material.dart';
import 'package:super_app/ui/widgets/bottom_button.dart';
import 'package:super_app/ui/widgets/gender_widget.dart';
import 'package:super_app/ui/widgets/my_card.dart';
import 'package:super_app/ui/widgets/step_widget.dart';
import 'package:super_app/util/bmi_brain.dart';
import 'package:super_app/util/colors.dart';
import 'package:super_app/util/styles.dart';

import 'bmi_result.dart';

const ROUTE_BMI_CALCULATOR = '/bmi-calculator';

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  Gender _selectedGender;
  int _height = 30;
  int _weight = 42;
  int _age = 21;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: MyStyles.bmiTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          elevation: 0.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 12.0),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyCard(
                      color: _selectedGender == Gender.male
                          ? MyColors.activeCard
                          : MyColors.inactiveCard,
                      child: GenderWidget(gender: Gender.male),
                      onTap: () => setState(() => _selectedGender = Gender.male),
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      color: _selectedGender == Gender.female
                          ? MyColors.activeCard
                          : MyColors.inactiveCard,
                      child: GenderWidget(gender: Gender.female),
                      onTap: () => setState(() => _selectedGender = Gender.female),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          _height.toString(),
                          style: TextStyle(fontSize: 46.0),
                        ),
                        SizedBox(width: 4.0),
                        Text('cm', style: TextStyle(fontSize: 24.0)),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 8.0,
                        activeTrackColor: MyColors.accent,
                        inactiveTrackColor: MyColors.background,
                        thumbColor: MyColors.accent,
                        overlayColor: MyColors.accentTranslucent,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      ),
                      child: Slider(
                        min: 30.0,
                        max: 260.0,
                        value: _height.toDouble(),
                        onChanged: (newHeight) =>
                            setState(() => _height = newHeight.toInt()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyCard(
                      child: StepWidget(
                        label: 'WEIGHT',
                        value: _weight,
                        onIncrement: () => setState(() => _weight++),
                        onDecrement: () => setState(() => _weight--),
                        increaseBy10: () => setState(() => _weight += 10),
                        decreaseBy10: () => setState(() => _weight -= 10),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      child: StepWidget(
                        label: 'AGE',
                        value: _age,
                        onIncrement: () => setState(() => _age++),
                        onDecrement: () => setState(() => _age--),
                        increaseBy10: () => setState(() => _age += 10),
                        decreaseBy10: () => setState(() => _age -= 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              label: 'CALCULATE',
              onTap: () {
                BMIBrain bmi = BMIBrain(height: _height, weight: _weight);
                Navigator.of(context).pushNamed(
                  ROUTE_BMI_RESULT,
                  arguments: {'bmi': bmi.calculateBMI()},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
