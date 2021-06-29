import 'package:flutter_favorcate/provider/favorite_provider.dart';
import 'package:flutter_favorcate/provider/filter_provider.dart';
import 'package:flutter_favorcate/provider/meal_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProvidersConfig {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (ctx) => FilterProvider()),
    ChangeNotifierProxyProvider<FilterProvider, MealProvider>(
      create: (ctx) => MealProvider(),
      update: (ctx, filterProvider, mealProvider) {
        if (mealProvider == null) throw ArgumentError.notNull('MealProvider');
        mealProvider.filterProvider = filterProvider;
        return mealProvider;
      },
    ),
    ChangeNotifierProxyProvider<FilterProvider, FavoriteProvider>(
      create: (ctx) => FavoriteProvider(),
      update: (ctx, filterProvider, favoriteProvider) {
        if (favoriteProvider == null)
          throw ArgumentError.notNull('FavoriteProvider');
        favoriteProvider.filterProvider = filterProvider;
        return favoriteProvider;
      },
    )
  ];
}
