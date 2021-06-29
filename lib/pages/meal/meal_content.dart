import 'package:flutter/material.dart';
import 'package:flutter_favorcate/common/size_fit.dart';
import 'package:flutter_favorcate/model/category_model.dart';
import 'package:flutter_favorcate/model/meal_model.dart';
import 'package:flutter_favorcate/pages/meal/meal_item.dart';
import 'package:flutter_favorcate/provider/meal_provider.dart';
import 'package:provider/provider.dart';

class MealContent extends StatelessWidget {
  const MealContent(this._category, {Key? key}) : super(key: key);
  final CategoryModel _category;

  @override
  Widget build(BuildContext context) {
    return Consumer<MealProvider>(
      builder: (ctx, value, child) {
        final mealList = getMealList(value.mealList);
        return ListView.builder(
          itemCount: mealList.length,
          padding: EdgeInsets.all(10.rpx),
          itemBuilder: (_ctx, index) {
            return MealItem(mealList[index]);
          },
        );
      },
    );
  }

  List<MealModel> getMealList(List<MealModel> mealList) {
    return mealList.where(
      (item) {
        return item.categories.any((element) => element == _category.id);
      },
    ).toList();
  }
}
