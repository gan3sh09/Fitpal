// ignore_for_file: prefer_final_fields

import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/form_validation/formValidation.dart';
import 'package:fitpal/screens/nutrition_tracker_screen/layout/add_nutrition_function.dart';
import 'package:flutter/material.dart';

class AddNutritionScreen extends StatefulWidget {
  const AddNutritionScreen({super.key});

  @override
  State<AddNutritionScreen> createState() => _AddNutritionScreenState();
}

class _AddNutritionScreenState extends State<AddNutritionScreen> {
  //* form key for form validation
  final _formKey = GlobalKey<FormState>();
  TextEditingController datePicker = TextEditingController();
  TextEditingController entryNumber = TextEditingController();
  TextEditingController foodName = TextEditingController();
  TextEditingController nutritionIntake = TextEditingController();
  TextEditingController caloriesConsumed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: const Text(
            "Nutrition Tracker",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.005),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* textform fields starts from heree --------------------------------

                  //* date textform field
                  const Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  /* CustomTextFormField(
                    controller: firstNameController,
                    keyboardType: TextInputType.name,
                  ), */
                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: datePicker,
                    decoration: const InputDecoration(
                      filled: true,
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),

                  SizedBox(
                    height: screenHeight * 0.005,
                  ),

                  //* entry textform field
                  const Text(
                    "Entry Number",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: entryNumber,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  //* food name textform field
                  const Text(
                    "Food Name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: foodName,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  //* calories  textform field
                  const Text(
                    "Nutrition Intake",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: nutritionIntake,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(),
                  ),
                  //* total calories consumed   textform field
                  const Text(
                    "Calories Consumed",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: caloriesConsumed,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  //*Save button
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible:
                                false, // Prevents dismissing dialog by tapping outside
                            builder: (BuildContext context) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              );
                            },
                          );

                          // Simulate a delay of 3 seconds before navigating
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pop(context); // Close the dialog
                            if (_formKey.currentState!.validate()) {
                              addNutrition(
                                context,
                                datePicker,
                                entryNumber,
                                foodName,
                                nutritionIntake,
                                caloriesConsumed,
                              );
                            }
                          });
                        },
                        child: const Text('Add'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        datePicker.text = picked.toString().split(" ")[0];
      });
    }
  }
}
