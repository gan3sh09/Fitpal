import 'package:fitpal/constants/constraints.dart';
import 'package:flutter/material.dart';

class NutritionTrackerText extends StatelessWidget {
  final double fontSize;
  final FontWeight? fontWeight;
  final String text;
  final Color? textColor;
  const NutritionTrackerText(
      {super.key,
      required this.text,
      required this.fontSize,
      this.fontWeight,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kTextStyle.textStyle(
        fontWeight: fontWeight,
        textColor: textColor,
        textSize: fontSize,
      ),
    );
  }
}
