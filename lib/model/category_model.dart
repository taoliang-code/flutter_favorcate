import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id = '';
  String title = '';
  String colorRgb = '';
  Color color = Colors.transparent;

  CategoryModel({required this.id, required this.title, required this.color});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    colorRgb = json['color'];
    final colorInt = int.parse(colorRgb, radix: 16);
    color = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
