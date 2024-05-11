import 'package:fitpal/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  // App theme
  static InputDecorationTheme lightTextFormFieldTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: secondaryColor,
    contentPadding: EdgeInsets.symmetric(vertical: 13,horizontal: 7),
    suffixIconColor: secondaryColor,
    floatingLabelStyle: TextStyle(color: secondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: primaryColor),
    ),
  );
}
