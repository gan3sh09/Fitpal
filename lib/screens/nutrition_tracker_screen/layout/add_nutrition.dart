// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class AddNutritionScreen extends StatefulWidget {
  const AddNutritionScreen({super.key});

  @override
  State<AddNutritionScreen> createState() => _AddNutritionScreenState();
}

class _AddNutritionScreenState extends State<AddNutritionScreen> {
  TextEditingController _datePicker = TextEditingController();
  TextEditingController _entryNumber = TextEditingController();
  TextEditingController _foodName = TextEditingController();
  TextEditingController _nutritionIntake = TextEditingController();

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //* textform fields starts from heree --------------------------------

                //* First name textform field
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
                TextField(
                  controller: _datePicker,
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

                //* last name textform field
                const Text(
                  "Entry Number",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                /* CustomTextFormField(
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                ), */
                TextFormField(
                  controller: _entryNumber,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                //* mobile  textform field
                const Text(
                  "Food Name",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                /* CustomTextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                ), */
                TextFormField(
                  controller: _foodName,
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                //* current height  textform field
                const Text(
                  "Nutrition Intake",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                /* CustomTextFormField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                ), */
                TextFormField(
                  controller: _nutritionIntake,
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
                      onPressed: () {},
                      child: const Text('Add'),
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
        _datePicker.text = picked.toString().split(" ")[0];
      });
    }
  }
}
