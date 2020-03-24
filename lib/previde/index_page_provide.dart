import 'package:flutter/material.dart';

class IndexPageProvide extends ChangeNotifier {
  num _currentIndex = 0;

  num get currentIndex => _currentIndex;

  set currentIndex(num value) {
    _currentIndex = value;
    notifyListeners();
  }


}