import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.black,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.gold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        selectedIconTheme: IconThemeData(size: 26),
        showSelectedLabels: true,
      ));
}
