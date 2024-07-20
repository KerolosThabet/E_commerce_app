import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors_manager.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      color: Colors.transparent,
    ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsManager.primaryColor,
          primary: ColorsManager.primaryColor
      ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 18.sp ,fontWeight:FontWeight.w500,color: ColorsManager.headLineColor)
    )
  );
}