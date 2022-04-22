import 'package:flutter/material.dart';
import 'package:keyofscience/FontsManager.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import 'Styles_Manager.dart';

ThemeData getThemeData()=>ThemeData(
  /// main colors
  primaryColor: ColorManager.primaryColor,
  splashColor: ColorManager.lightDefaultColor,
  /// apBar theme
  appBarTheme: AppBarTheme(
    titleTextStyle: boldStyle(
        color: ColorManager.defaultColor,
        fontSize: FontSizeManager.s24,
        fontWeight: FontWeightManager.bold),
    centerTitle: true,
  ),
  /// button theme
    buttonTheme: const ButtonThemeData(
      splashColor: ColorManager.lightDefaultColor,
     // buttonColor: ColorManager.defaultColor,
      buttonColor: Colors.red,
    ),
  /// textButton theme
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: lightStyle(color: ColorManager.defaultColor,fontWeight: FontWeightManager.bold)
    )
  ),
  /// elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
       elevation: AppElevation.e5,
       padding: const EdgeInsets.all(AppPadding.p12),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMargin.m10)),
       primary: ColorManager.defaultColor,
       textStyle: semiBoldStyle(color: ColorManager.white),
      // ColorManager.defaultColor
    )
  ),

  /// textFormFiled Theme
    inputDecorationTheme:  InputDecorationTheme(
      contentPadding: const EdgeInsets.only(left: AppPadding.p14, bottom: AppPadding.p8, top: AppPadding.p8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r8),
),
      filled: true,
      fillColor: ColorManager.white,
      hintStyle: lightStyle(color: ColorManager.grey),
      errorStyle: RegularStyle(color: ColorManager.error),
      errorMaxLines: 1,
    ),
  /// Text Theme
  textTheme: TextTheme(
  //  labelSmall: lightStyle(color: ColorManager.defaultColor),
   // titleLarge: boldStyle(color: ColorManager.black,fontSize: FontSizeManager.s30),
    headline1: boldStyle(color: ColorManager.black,fontSize: FontSizeManager.s30),
    caption: RegularStyle(color: ColorManager.grey1),
    headline2: lightStyle(color: ColorManager.defaultColor),
  )
);