import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  bool _isGlutenFree = true;
  bool _isVegan = true;
  bool _isVegetarian = true;
  bool _isLactoseFree = true;

  bool get isGlutenFree => _isGlutenFree;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  bool get isVegan => this._isVegan;

  set isVegan(value) {
    _isVegan = value;
    notifyListeners();
  }

  bool get isVegetarian => _isVegetarian;

  set isVegetarian(value) {
    _isVegetarian = value;
    notifyListeners();
  }

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(value) {
    _isLactoseFree = value;
    notifyListeners();
  }
}
