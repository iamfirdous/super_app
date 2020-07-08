import 'dart:math';

import 'package:super_app/models/bmi.dart';

class BMIBrain {
  BMI bmi = BMI();
  int height;
  int weight;

  BMIBrain({this.height, this.weight});

  BMI calculateBMI() {
    final double b = weight / pow(height / 100, 2);
    bmi.bmiResult = b.toStringAsFixed(1);
    if (b <= 18.5) {
      bmi.resultText = 'Underweight';
      bmi.interpretation = 'You are too thin, you need to eat a lot to stay fit.';
    } else if (b > 18.5 && b <= 25) {
      bmi.resultText = 'Normal';
      bmi.interpretation = 'You are perfectly normal and doing well, keep it up.';
    } else if (b > 25) {
      bmi.resultText = 'Overweight';
      bmi.interpretation = 'You are too obese, it\'s time to hit the gym.';
    }
    return bmi;
  }
}
