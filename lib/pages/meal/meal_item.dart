import 'package:flutter/material.dart';
import 'package:flutter_favorcate/common/size_fit.dart';
import 'package:flutter_favorcate/generated/l10n.dart';
import 'package:flutter_favorcate/model/meal_model.dart';
import 'package:flutter_favorcate/pages/meal/detail/meal_detail.dart';
import 'package:flutter_favorcate/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class MealItem extends StatelessWidget {
  const MealItem(this._meal, {Key? key}) : super(key: key);

  final MealModel _meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          MealDetailPage.routerName,
          arguments: _meal,
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.rpx),
        ),
        child: Column(
          children: [
            buildMealCover(),
            buildMealDesc(context),
          ],
        ),
      ),
    );
  }

  // 封面
  Widget buildMealCover() {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.rpx),
        ),
        child: Image.network(
          _meal.imageUrl,
          width: 730.rpx,
          height: 400.rpx,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 60.rpx,
          color: Colors.black54,
          child: Row(
            children: [
              SizedBox(
                width: 20.rpx,
              ),
              Text(
                _meal.title,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  // 描述
  Widget buildMealDesc(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.rpx),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          mealDescItem(
            Icon(Icons.query_builder),
            '${_meal.duration}${S.of(context).minutes}',
          ),
          mealDescItem(
            Icon(Icons.restaurant),
            _meal.complexityStr,
          ),
          Consumer<FavoriteProvider>(
            builder: (ctx, favoriteProvider, child) {
              return GestureDetector(
                child: mealDescItem(
                  favoriteProvider.isFavorite(_meal)
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(Icons.favorite_border),
                  favoriteProvider.isFavorite(_meal)
                      ? S.of(context).collected
                      : S.of(context).favorite,
                ),
                onTap: () {
                  favoriteProvider.favorite(_meal);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // 操作
  Widget mealDescItem(Icon icon, String label) {
    return Container(
      width: 190.rpx,
      padding: EdgeInsets.symmetric(vertical: 28.rpx),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 5.rpx,
          ),
          Text(label),
        ],
      ),
    );
  }
}
