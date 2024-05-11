import 'package:flutter/material.dart';

Color themeColor = const Color.fromARGB(255, 9, 17, 242);

class KTextStyle {
  //*body  textstyle
  static textStyle(
      {Color? textColor, double? textSize, FontWeight? fontWeight}) {
    return TextStyle(
      color: textColor ?? Colors.black,
      fontSize: textSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
