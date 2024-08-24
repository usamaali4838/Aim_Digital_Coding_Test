import 'package:flutter/material.dart';

class TextStyleUtil {
  static TextStyle sfLightTextStyle({
    double fontSize = 14,
    Color? color,
    TextDecoration? decoration,
    double? fontHeight,
  }) {
    return _textStyle(
      fontHeight: fontHeight,
      fontSize: fontSize,
      color: color ?? Colors.black87,
      fontFamily: 'Poppins-Light',
      decoration: decoration,
    );
  }

  static TextStyle sfRegularTextStyle({
    double fontSize = 14,
    Color? color,
    TextDecoration? decoration,
    double? fontHeight,
  }) {
    return _textStyle(
      fontHeight: fontHeight,
      fontSize: fontSize,
      color: color ?? Colors.black87,
      fontFamily: 'Poppins-Regular',
      decoration: decoration,
    );
  }

  static TextStyle sfBoldTextStyle({
    double fontSize = 14,
    Color? color,
    TextDecoration? decoration,
    double? fontHeight,
  }) {
    return _textStyle(
      fontHeight: fontHeight,
      fontSize: fontSize,
      color: color ?? Colors.black87,
      fontFamily: 'Poppins-Bold',
      decoration: decoration,
    );
  }

  static TextStyle sfMediumTextStyle({
    double fontSize = 14,
    Color? color,
    TextDecoration? decoration,
    double? fontHeight,
  }) {
    return _textStyle(
      fontHeight: fontHeight,
      fontSize: fontSize,
      color: color ?? Colors.black87,
      fontFamily: 'Poppins-Medium',
      decoration: decoration,
    );
  }

  static TextStyle sfSemiBoldTextStyle({
    double fontSize = 14,
    Color? color,
    TextDecoration? decoration,
    double? fontHeight,
  }) {
    return _textStyle(
      fontHeight: fontHeight,
      fontSize: fontSize,
      color: color ?? Colors.black87,
      fontFamily: 'Poppins-SemiBold',
      decoration: decoration,
    );
  }

  ///create the given text style and return
  static TextStyle _textStyle(
      {double? fontHeight,
      FontWeight? fontWeight,
      double fontSize = 12,
      Color? color,
      TextDecoration? decoration,
      String? fontFamily,
      FontStyle? fontStyle}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        height: fontHeight,
        decoration: decoration,
        fontStyle: fontStyle);
  }
}
