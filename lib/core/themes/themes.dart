import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColorLight,
        foregroundColor: Colors.white,
      ),
      primaryColor: AppColors.primaryColorLight,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontFamily: 'Arial',
          color: AppColors.greyColor2,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

ThemeData darkTheme() => ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontFamily: 'Arial',
          fontSize: 20,
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Arial',
          color: AppColors.greyColor2,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      scaffoldBackgroundColor: AppColors.greyColor,
    );
