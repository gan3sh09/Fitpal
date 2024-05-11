import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/sizes.dart';
import 'package:flutter/material.dart';

class EElevatedButtonTheme {
  EElevatedButtonTheme._();

  // light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        side: const BorderSide(color: primaryColor),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight)),
  );
}
