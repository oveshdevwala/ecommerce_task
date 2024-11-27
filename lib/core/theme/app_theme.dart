import 'package:ecommerce_task/core/core.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      textTheme: textTheme(),
      appBarTheme: appBarTheme(),
      elevatedButtonTheme: elevatedButtonTheme());
}
