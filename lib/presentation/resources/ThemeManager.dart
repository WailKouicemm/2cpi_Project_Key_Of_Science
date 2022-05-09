import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import 'Styles_Manager.dart';

ThemeData getThemeData()=>ThemeData(
  /// main colors
  primaryColor: ColorManager.primaryColor,
  splashColor: ColorManager.lightDefaultColor,
  /// apBar theme
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(
      color: ColorManager.defaultColor,
    ),
    titleTextStyle: boldStyle(
        color: ColorManager.black,
        fontSize: FontSizeManager.s24,
        fontWeight: FontWeightManager.bold),
    centerTitle: true,
  ),
  /// icon button theme
    iconTheme: const IconThemeData(
      color: ColorManager.defaultColor,
    ),
  /// bottmNavy theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: ColorManager.defaultColor,
    unselectedItemColor: ColorManager.grey,
  ),
  /// button theme
    buttonTheme: const ButtonThemeData(
      splashColor: ColorManager.lightDefaultColor,
      disabledColor: ColorManager.grey,
      focusColor: ColorManager.lightDefaultColor
     // buttonColor: ColorManager.defaultColor,
    ),
  /// textButton theme
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: lightStyle(color: ColorManager.defaultColor,fontWeight: FontWeightManager.bold),
    )
  ),

  /// elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
       elevation: AppElevation.e5,
       padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15, vertical: AppPadding.p12),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMargin.m10)),
       primary: ColorManager.defaultColor,
       textStyle: semiBoldStyle(color: ColorManager.white),
      // ColorManager.defaultColor
    )
  ),
  /// Floating Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.selectColor,
      focusColor: ColorManager.defaultColor,
      splashColor: ColorManager.defaultColor
    ),
  /// textFormFiled Theme
    inputDecorationTheme:  InputDecorationTheme(
      hoverColor: Colors.red,
      contentPadding: const EdgeInsets.only(left: AppPadding.p14, bottom: AppPadding.p8, top: AppPadding.p8),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.grey, width: 1),
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      filled: true,
      fillColor: ColorManager.white,
      hintStyle: lightStyle(color: ColorManager.grey),
      errorStyle: regularStyle(color: ColorManager.error),
      errorMaxLines: 2,
      iconColor: ColorManager.defaultColor,
    ),
  /// Text Theme
  textTheme: TextTheme(
  //  labelSmall: lightStyle(color: ColorManager.defaultColor),
   // titleLarge: boldStyle(color: ColorManager.black,fontSize: FontSizeManager.s30),
    headline1: boldStyle(color: ColorManager.black,fontSize: FontSizeManager.s30),
    caption: regularStyle(color: ColorManager.grey1),
    headline2: lightStyle(color: ColorManager.defaultColor),
    headline3: boldStyleBackgrounded(ColorManager.white, FontSizeManager.s30,ColorManager.defaultColor),
    headline4: boldStyle(color: ColorManager.black,fontWeight: FontWeightManager.boldPlus),
    headline6: mediumStyle(color: ColorManager.defaultColor),
    subtitle1: mediumStyle(color: ColorManager.white,fontSize: FontSizeManager.s15),
    subtitle2: lightStyle(color: ColorManager.white,fontSize: FontSizeManager.s13),
    bodyText2: regularStyle(color: ColorManager.grey),
    bodyText1: mediumStyle(color: ColorManager.black,fontSize: FontSizeManager.s15),
    headline5: boldStyle(color: ColorManager.defaultColor,fontSize: FontSizeManager.s30),
    overline: regularStyle(color: ColorManager.black,fontWeight: FontWeightManager.medium),
  )
);