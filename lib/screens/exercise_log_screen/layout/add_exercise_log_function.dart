import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/services/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

void addExerciseLog(BuildContext context, TextEditingController dateController,
    durationController, intensityController, workoutTypeController) async {
  //* generating custom id
  String id = randomAlphaNumeric(5);

  Map<String, dynamic> exerciseLogInfo = {
    "id": id,
    "date": dateController.text,
    "duration": durationController.text,
    "intensity": intensityController.text,
    "workout_type": workoutTypeController.text,
  };

  await DatabaseMethods().addExerciseLogInfo(exerciseLogInfo, id).then((value) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: primaryColor,
        content: const Text(
          'Exercise log Info Added Successfully!',
          style: TextStyle(color: whiteColor),
        ),
      ),
    );
    dateController.text = "";
    durationController.text = "";
    intensityController.text = "";
    workoutTypeController.text = "";
  });
}
