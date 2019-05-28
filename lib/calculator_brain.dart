import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double _getBMI() {
    return weight / pow(height / 100, 2);
  }

  String calculateBMI() {
    return _getBMI().toStringAsFixed(1);
  }

  String getResult() {
    if (_getBMI() >= 25) {
      return 'Overweight';
    } else if (_getBMI() > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_getBMI() >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_getBMI() > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bir more.';
    }
  }
}
