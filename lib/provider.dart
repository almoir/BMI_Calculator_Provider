// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProviderC with ChangeNotifier {
  bool _isMale = true;
  double _weight = 50;
  double _height = 75;

  bool get isMale => _isMale;
  double get weight => _weight;
  double get height => _height;

  set isMale(bool newValue) {
    _isMale = newValue;
    notifyListeners();
  }

  set weight(double newValue) {
    _weight = newValue;
    notifyListeners();
  }

  set height(double newValue) {
    _height = newValue;
    notifyListeners();
  }

  get color => isMale ? Colors.blue : Colors.pinkAccent;
  get maleColor => isMale ? Colors.blue : Colors.grey;
  get femaleColor => isMale ? Colors.grey : Colors.pinkAccent;
}

class HeightProvider with ChangeNotifier {
  final double _height = 100;

  double get height => _height;

  set height(double newValue) {
    height = newValue;
    notifyListeners();
  }
}
