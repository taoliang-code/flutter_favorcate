import 'package:flutter/material.dart';
import 'package:flutter_favorcate/model/category_model.dart';
import 'package:flutter_favorcate/pages/meal/meal_content.dart';

class MealPage extends StatelessWidget {
  static const routerName = '/meal';
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: Center(
        child: MealContent(category),
      ),
    );
  }
}
