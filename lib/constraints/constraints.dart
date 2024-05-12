import 'package:flutter/material.dart';

Color themeColor = Color.fromARGB(255, 9, 17, 242);

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
