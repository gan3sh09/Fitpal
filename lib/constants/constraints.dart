// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

Color themeColor = const Color(0xFF673AB7);

class kTextStyle {
  //*body  textstyle
  static textStyle(
      {Color? textColor, double? textSize, FontWeight? fontWeight}) {
    return TextStyle(
      color: textColor ?? Colors.white,
      fontSize: textSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
