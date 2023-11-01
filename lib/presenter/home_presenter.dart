import 'package:flutter/material.dart';

class HomePresenter extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
