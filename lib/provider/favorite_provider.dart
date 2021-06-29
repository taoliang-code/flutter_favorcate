import 'package:flutter/cupertino.dart';
import 'package:flutter_favorcate/model/meal_model.dart';
import 'package:flutter_favorcate/network/home/home_request.dart';
import 'package:flutter_favorcate/provider/filter_provider.dart';
import 'package:flutter_favorcate/provider/meal_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 收藏列表
class FavoriteProvider extends ChangeNotifier {
  final _favoriteIdsKey = 'meal_favorite_id';
  List<MealModel> _favoriteMealList = [];
  FilterProvider? _filterProvider;

  set filterProvider(FilterProvider filterProvider) =>
      _filterProvider = filterProvider;

  FavoriteProvider() {
    _initailizeFavoriteMealList();
  }

  List<MealModel> get favoriteMealList {
    if (_filterProvider == null) {
      return _favoriteMealList;
    } else {
      return _favoriteMealList.where((meal) {
        if (meal.isGlutenFree && !_filterProvider!.isGlutenFree) return false;
        if (meal.isLactoseFree && !_filterProvider!.isLactoseFree) return false;
        if (meal.isVegan && !_filterProvider!.isVegan) return false;
        if (meal.isVegetarian && !_filterProvider!.isVegetarian) return false;
        return true;
      }).toList();
    }
  }

  // 收藏
  void favorite(MealModel meal) {
    if (isFavorite(meal)) {
      removeFavorite(meal);
    } else {
      addFavorite(meal);
    }
  }

  // 是否已收藏
  bool isFavorite(MealModel meal) {
    return _favoriteMealList.contains(meal);
  }

  // 添加收藏
  addFavorite(MealModel meal) {
    _favoriteMealList.add(meal);
    notifyListeners();
    _saveFavoriteIds();
    print(MealProvider().mealList);
  }

  // 移除收藏
  removeFavorite(MealModel meal) {
    _favoriteMealList.remove(meal);
    notifyListeners();
    _saveFavoriteIds();
  }

  // 获取收藏id
  String _getFavoriteIds() {
    if (_favoriteMealList.length <= 0) return '';
    return _favoriteMealList.map((item) => item.id).toList().join(',');
  }

  void _saveFavoriteIds() {
    SharedPreferences.getInstance().then((SharedPreferences preferences) {
      final String favoriteIds = _getFavoriteIds();
      preferences.setString(_favoriteIdsKey, favoriteIds);
    });
  }

  void _initailizeFavoriteMealList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String favoriteIds = preferences.getString(_favoriteIdsKey) ?? '';
    final List<String> favoriteIdList =
        favoriteIds == '' ? [] : favoriteIds.split(',');
    final List<MealModel> mealList = await HomeRequest.getMeals();
    _favoriteMealList =
        mealList.where((item) => favoriteIdList.contains(item.id)).toList();
    print(_favoriteMealList);
    notifyListeners();
  }
}
