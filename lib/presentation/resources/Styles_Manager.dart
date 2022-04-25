import 'package:flutter/material.dart';
import 'package:keyofscience/FontsManager.dart';

TextStyle _textStyle(Color color, double fontSize, FontWeight fontWeight) =>
    TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize,fontFamily: FontFamilyManager.defaultFamily);


TextStyle boldStyleBackgrounded(Color color, double fontSize,Color backgroundColor) =>
    TextStyle(color: color, fontWeight:  FontWeightManager.bold, fontSize: fontSize,fontFamily: FontFamilyManager.defaultFamily
        ,backgroundColor: backgroundColor);



TextStyle lightStyle({required color, fontSize = FontSizeManager.s12, fontWeight = FontWeightManager.light}) =>
    _textStyle(color, fontSize, fontWeight);

TextStyle regularStyle({required color, fontSize = FontSizeManager.s14, fontWeight = FontWeightManager.regular}) =>
    _textStyle(color, fontSize, fontWeight);

TextStyle mediumStyle({required color, fontSize = FontSizeManager.s16, fontWeight = FontWeightManager.medium}) =>
    _textStyle(color, fontSize, fontWeight);

TextStyle semiBoldStyle({required color, fontSize = FontSizeManager.s18, fontWeight = FontWeightManager.semiBold}) =>
    _textStyle(color, fontSize, fontWeight);

TextStyle boldStyle({required color, fontSize = FontSizeManager.s20, fontWeight = FontWeightManager.bold}) =>
    _textStyle(color, fontSize, fontWeight);
