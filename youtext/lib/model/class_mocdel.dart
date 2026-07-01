import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ClassMocdel with ChangeNotifier {
  int counter=0;

  void increment() {
    counter++;
    notifyListeners();
  }
  void decrement() {
    counter--;
    notifyListeners();
  }


}