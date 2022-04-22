import 'package:flutter/material.dart';
import 'package:keyofscience/FontsManager.dart';

TextStyle _textStyle(Color color, double fontSize, FontWeight fontWeight) =>
    TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize,fontFamily: FontFamilyManager.defaultFamily);


TextStyle lightStyle({required color, fontSize = FontSizeManager.s12, fontWeight = FontWeightManager.light}) =>
    _textStyle(color, fontSize, fontWeight);

TextStyle RegularStyle({required color, fontSize = FontSizeManager.s14, fontWeight = FontWeightManager.regular}) =>
    _textStyle(color, fontSize, fontWeight);

TextStyle mediumStyle({required color, fontSize = FontSizeManager.s16, fontWeight = FontWeightManager.medium}) =>
    _textStyle(color, fontSize, fontWeight);

TextStyle semiBoldStyle({required color, fontSize = FontSizeManager.s18, fontWeight = FontWeightManager.semiBold}) =>
    _textStyle(color, fontSize, fontWeight);

TextStyle boldStyle({required color, fontSize = FontSizeManager.s20, fontWeight = FontWeightManager.bold}) =>
    _textStyle(color, fontSize, fontWeight);
