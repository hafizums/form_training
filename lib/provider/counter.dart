import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int value = 0;

  void increment() {
    value = value + 1;
    notifyListeners();
  }
}
