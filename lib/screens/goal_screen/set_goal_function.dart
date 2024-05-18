import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/services/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

void setGoal(BuildContext context, TextEditingController dateController,
    durationController, currentWeightController, targetWeightController) async {
  //* generating custom id
  String id = randomAlphaNumeric(5);
  DateTime now = DateTime.now();
  Map<String, dynamic> goalInfoMap = {
    "id": id,
    "date": dateController.text,
    "duration": durationController.text,
    "current_weight": currentWeightController.text,
    "target_weight": targetWeightController.text,
    "createdAt": now.toIso8601String(),
  };

  await DatabaseMethods().setGoalInfo(goalInfoMap, id).then((value) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: primaryColor,
        content: const Text(
          'Setting goal successfully!',
          style: TextStyle(color: whiteColor),
        ),
      ),
    );
    dateController.text = "";
    durationController.text = "";
    currentWeightController.text = "";
    targetWeightController.text = "";
  });
}
