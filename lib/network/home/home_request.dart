import 'package:flutter_favorcate/model/meal_model.dart';
import 'package:flutter_favorcate/network/http_request.dart';

class HomeRequest {
  static Future<List<MealModel>> getMeals() async {
    final result = await HttpRequest.get('meal/detail');
    final data = result['data'] as List;
    return data.map((item) => MealModel.fromJson(item)).toList();
  }
}
