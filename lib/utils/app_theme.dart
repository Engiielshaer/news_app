
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';

class MyThemeData{
  static final ThemeData lightTheme= ThemeData(
    primaryColor: AppColors.brimaryLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.brimaryLightColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),),),
    textTheme: TextTheme(
      titleLarge:TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.whiteColor
      ),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blackColor),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blackColor)
    )
  );
}