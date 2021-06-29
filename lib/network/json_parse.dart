import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_favorcate/model/category_model.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    // 1. 加载json文件
    final jsonString = await rootBundle.loadString('assets/json/category.json');

    // 2. 将jsonString转成map/json
    final result = json.decode(jsonString);

    // 3. 将map中的内容转成对象
    final categorys = result['category'];
    List<CategoryModel> categoryList = [];
    for (var category in categorys) {
      categoryList.add(CategoryModel.fromJson(category));
    }
    return categoryList;
  }
}
