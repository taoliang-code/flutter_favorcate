import 'package:flutter/cupertino.dart';
import 'package:flutter_favorcate/pages/base/base.dart';
import 'package:flutter_favorcate/pages/filter/filter.dart';
import 'package:flutter_favorcate/pages/meal/detail/meal_detail.dart';
import 'package:flutter_favorcate/pages/meal/meal.dart';

class CustomRouter {
  // 初始化路由
  static final String initialRoute = BasePage.routerName;

  // 路由列表
  static final Map<String, WidgetBuilder> routes = {
    BasePage.routerName: (context) => BasePage(),
    MealPage.routerName: (context) => MealPage(),
    MealDetailPage.routerName: (context) => MealDetailPage(),
    FilterPage.routerName: (context) => FilterPage(),
  };

  // 缺省路由
  static final RouteFactory generateRoute = (settings) {};

  // 错误路由
  static final RouteFactory unknownRoute = (settings) {};
}
