import 'package:fitpal/constraints/constraints.dart';
import 'package:fitpal/widgets/custome_textform_field.dart';
import 'package:flutter/material.dart';

class AddNutritionTrackerScreen extends StatefulWidget {
  const AddNutritionTrackerScreen({super.key});

  @override
  State<AddNutritionTrackerScreen> createState() =>
      _AddNutritionTrackerScreenState();
}

class _AddNutritionTrackerScreenState extends State<AddNutritionTrackerScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController entryNumberController = TextEditingController();
  TextEditingController foodNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController nutritionIntakeController = TextEditingController();

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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: screenHeight * 0.03,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "FitPal",
          style: kTextStyle.textStyle(
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
              textSize: 22),
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
              //* user info
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Nutrition Tracker ",
                  style: kTextStyle.textStyle(
                      fontWeight: FontWeight.bold,
                      textColor: themeColor,
                      textSize: 18),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              //* textform fields starts from heree --------------------------------

              //* date textform field
              Text(
                "Date",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),
              CustomTextFormField(
                controller: dateController,
                keyboardType: TextInputType.name,
              ),

              SizedBox(
                height: screenHeight * 0.005,
              ),

              //* Entry number textform field
              Text(
                "Entry number",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: entryNumberController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* food name  textform field
              Text(
                "Food name",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: foodNameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* nutrition intake  textform field
              Text(
                "Nutrition intake",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
              ),

              SizedBox(
                height: screenHeight * 0.03,
              ),
              //*Save button
              Center(
                child: MaterialButton(
                  color: themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    // child:
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2,
                        vertical: screenHeight * 0.014),
                    child: Text("Add",
                        style: kTextStyle.textStyle(
                            textColor: Colors.white,
                            textSize: 17,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
