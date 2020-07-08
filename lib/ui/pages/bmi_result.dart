import 'package:flutter/material.dart';
import 'package:super_app/models/bmi.dart';
import 'package:super_app/ui/widgets/bottom_button.dart';
import 'package:super_app/ui/widgets/my_card.dart';
import 'package:super_app/util/styles.dart';

const ROUTE_BMI_RESULT = '/bmi-result';

class BMIResultPage extends StatelessWidget {
  final BMI bmi;

  BMIResultPage({@required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: MyStyles.bmiTheme,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 36.0,
                  ),
                ),
              ),
              Expanded(
                child: MyCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bmi.resultText.toUpperCase(),
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        bmi.bmiResult,
                        style: TextStyle(
                          fontSize: 72.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          bmi.interpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                label: 'RE-CALCULATE',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
