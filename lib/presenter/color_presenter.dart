import 'package:flutter/material.dart';

class ColorPresenter extends ChangeNotifier {
  Color color = Colors.blue;
  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.purple,
    Colors.green,
  ];

  void setYellow() {
    color = Colors.yellow;
    notifyListeners();
  }

  void setPurple() {
    color = Colors.purple;
    notifyListeners();
  }

  void setRed() {
    color = Colors.red;
    notifyListeners();
  }

  void setDegfault() {
    color = Colors.blue;
  }

  void loopColor() async {
    for (int i = 0; i < colors.length; i++) {
      await Future.delayed(const Duration(seconds: 2));
      color = colors[i];
      notifyListeners();
    }
  }

  void serColor(int valor) {
    switch (valor) {
      case 1:
        setPurple();
        break;
      case 2:
        setRed();
        break;
      case 3:
        setYellow();
        break;
      default:
        setDegfault();
        break;
    }
  }
}
