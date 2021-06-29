import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favorcate/common/size_fit.dart';

class AppTheme {
  // 文字大小
  static final double smallFontSize = 24.rpx;
  static final double normalFontSize = 28.rpx;
  static final double largeFontSize = 32.rpx;
  static final double hugeFontSize = 50.rpx;

  static final Color normalTextColor = Color(0xff000000);
  // 默认主题
  static final ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    canvasColor: Color.fromRGBO(255, 254, 222, 1), // 背景颜色
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: normalFontSize,
        color: normalTextColor,
      ),
      headline1: TextStyle(
        fontSize: hugeFontSize,
        color: normalTextColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: largeFontSize,
        color: normalTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final Color darkTextColor = Colors.white;
  // 暗黑主题
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: normalFontSize,
        color: darkTextColor,
      ),
      headline1: TextStyle(
        fontSize: largeFontSize,
        color: normalTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
