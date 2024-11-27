import 'package:ecommerce_task/core/theme/colors_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme textTheme() {
  return TextTheme(
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold, color: AppColors.black, fontSize: 16.sp),
    titleMedium: TextStyle(
        fontWeight: FontWeight.bold, color: AppColors.black, fontSize: 14.sp),
    titleSmall: TextStyle(
        fontWeight: FontWeight.bold, color: AppColors.black, fontSize: 12.sp),
    displayLarge: TextStyle(color: AppColors.black, fontSize: 16.sp,fontWeight: FontWeight.w600),
    displayMedium: TextStyle(color: AppColors.black, fontSize: 14.sp,fontWeight: FontWeight.w600),
    displaySmall: TextStyle(color: AppColors.black, fontSize: 12.sp,fontWeight: FontWeight.w600),
    labelLarge: TextStyle(color: AppColors.grey, fontSize: 16.sp),
    labelMedium: TextStyle(color: AppColors.grey, fontSize: 14.sp),
    labelSmall: TextStyle(color: AppColors.grey, fontSize: 12.sp),
  );
}
