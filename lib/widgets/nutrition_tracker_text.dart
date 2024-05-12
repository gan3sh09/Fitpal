import 'package:fitpal/constraints/constraints.dart';
import 'package:flutter/material.dart';

class NutritionTrackerText extends StatelessWidget {
  final double fontSize;
  final FontWeight? fontWeight;
  final String text;
  const NutritionTrackerText(
      {super.key, required this.text, required this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kTextStyle.textStyle(
          fontWeight: fontWeight, textColor: Colors.black, textSize: fontSize),
    );
  }
}
