import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteColor),
  );

  static final ThemeData darkTheme = ThemeData();
}
