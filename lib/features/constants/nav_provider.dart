import 'package:flutter/material.dart';

class NavState extends ChangeNotifier{

  static NavState? _instance;

  static NavState get instance{
    _instance ??= NavState();
    return _instance!;
  }

  int currentIndex = 0;

  int get index => currentIndex;

  set selectedItem(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }

}