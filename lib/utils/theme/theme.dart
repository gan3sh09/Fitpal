import 'package:fitpal/utils/theme/widget_theme.dart/appbar_theme.dart';
import 'package:fitpal/utils/theme/widget_theme.dart/elevated_button_theme.dart';
import 'package:fitpal/utils/theme/widget_theme.dart/text_form_field_theme.dart';
import 'package:flutter/material.dart';

class AAppTheme {
  AAppTheme._();
// light theme
  static ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: scafLightBackground,
    // textTheme: TTextTheme.lightTextTheme,
    // outlinedButtonTheme: OOutlineButtonTheme.lightOutlineButtonTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightTextFormFieldTheme,
    appBarTheme: AAppBarTheme.lightAppBarTheme,
    // bottomSheetTheme: ShowModalBottomSheetTheme.lightModalBottomSheetTheme,
  );
}
