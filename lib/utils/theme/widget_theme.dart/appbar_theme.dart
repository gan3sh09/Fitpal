import 'package:fitpal/constants/colors.dart';
import 'package:flutter/material.dart';

class AAppBarTheme {
  AAppBarTheme._();

  // light theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: secondaryColor),
    centerTitle: false,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
  );
}
