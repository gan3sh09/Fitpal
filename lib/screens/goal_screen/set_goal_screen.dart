import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/form_validation/formValidation.dart';
import 'package:fitpal/screens/goal_screen/set_goal_function.dart';
import 'package:flutter/material.dart';

class SetGoalScreen extends StatefulWidget {
  const SetGoalScreen({super.key});

  @override
  State<SetGoalScreen> createState() => _SetGoalScreenState();
}

class _SetGoalScreenState extends State<SetGoalScreen> {
  //* form key for form validation
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController currentWeightController = TextEditingController();
  TextEditingController targettWeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
          "Set Goal",
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
                TextFormField(
                  validator: Validators.validateinputFields,
                  controller: dateController,
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

                //* duration textform field

                const Text(
                  "Duration",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                TextFormField(
                  validator: Validators.validateinputFields,
                  controller: durationController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                //* current weight  textform field

                const Text(
                  "Current weight",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                TextFormField(
                  validator: Validators.validateinputFields,
                  controller: currentWeightController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                //* Target weight  textform field
                const Text(
                  "Target weight",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                TextFormField(
                  validator: Validators.validateinputFields,
                  controller: targettWeightController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
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
                            setGoal(
                              context,
                              dateController,
                              durationController,
                              currentWeightController,
                              targettWeightController,
                            );
                          }
                        });
                      },
                      child: const Text('Set goal'),
                    ),
                  ),
                ),
              ],
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
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
