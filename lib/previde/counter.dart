import 'package:flutter/material.dart';

class Counter with ChangeNotifier {


  int _value = 0;

  int get value => _value;

  Counter(this._value);

  void increment() {
    _value++;
    notifyListeners();
  }


}