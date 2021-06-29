import 'package:flutter/material.dart';
import 'package:flutter_favorcate/model/meal_model.dart';
import 'package:flutter_favorcate/pages/meal/detail/meal_detail_content.dart';
import 'package:flutter_favorcate/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class MealDetailPage extends StatelessWidget {
  static const routerName = '/meal/detail';
  const MealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MealModel meal =
        ModalRoute.of(context)!.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: MealDetailContent(meal),
      floatingActionButton: Consumer<FavoriteProvider>(
        builder: (ctx, favoriteProvider, child) {
          return FloatingActionButton(
            child: favoriteProvider.isFavorite(meal)
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite_border),
            onPressed: () {
              favoriteProvider.favorite(meal);
            },
          );
        },
      ),
    );
  }
}
