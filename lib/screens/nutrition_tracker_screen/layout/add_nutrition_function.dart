import 'package:fitpal/services/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

void addNutrition(
  BuildContext context,
  TextEditingController datePicker,
  entryNumber,
  foodName,
  nutritionIntake,
  caloriesConsumed,
) async {
  //* generating custom id
  String Id = randomAlphaNumeric(5);

  Map<String, dynamic> nutritionInfo = {
    "id": Id,
    "date": datePicker.text,
    "entry_number": entryNumber.text,
    "food_name": foodName.text,
    "nutrition_intake": nutritionIntake.text,
    "calories_consumed": caloriesConsumed.text,
  };
  await DatabaseMethods().addNutritionInfo(nutritionInfo, Id).then((value) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Nutrition Info Added Successfully'),
      ),
    );
    datePicker.text = "";
    entryNumber.text = "";
    foodName.text = "";
    datePicker.text = "";
    caloriesConsumed.text = "";
  });
}
