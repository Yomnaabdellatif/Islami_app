import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        selectedIconTheme: IconThemeData(size: 26),
        showSelectedLabels: true,
      ));
}
