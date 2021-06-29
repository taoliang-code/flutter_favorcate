import 'package:flutter/material.dart';
import 'package:flutter_favorcate/model/meal_model.dart';
import 'package:flutter_favorcate/pages/meal/meal_item.dart';
import 'package:flutter_favorcate/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_favorcate/common/size_fit.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (ctx, favoriteProvider, child) {
        final List<MealModel> mealList = favoriteProvider.favoriteMealList;
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
}
