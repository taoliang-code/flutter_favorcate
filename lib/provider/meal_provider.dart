import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_favorcate/model/meal_model.dart';
import 'package:flutter_favorcate/network/home/home_request.dart';
import 'package:flutter_favorcate/provider/filter_provider.dart';

class MealProvider extends ChangeNotifier {
  List<MealModel> _mealList = [];
  FilterProvider? _filterProvider;

  set filterProvider(FilterProvider filterProvider) {
    _filterProvider = filterProvider;
  }

  List<MealModel> get mealList {
    if (_filterProvider == null) {
      return _mealList;
    } else {
      return _mealList.where((meal) {
        if (meal.isGlutenFree && !_filterProvider!.isGlutenFree) return false;
        if (meal.isLactoseFree && !_filterProvider!.isLactoseFree) return false;
        if (meal.isVegan && !_filterProvider!.isVegan) return false;
        if (meal.isVegetarian && !_filterProvider!.isVegetarian) return false;
        return true;
      }).toList();
    }
  }

  MealProvider() {
    HomeRequest.getMeals().then((res) {
      _mealList = res;
      notifyListeners();
    });
  }
}
