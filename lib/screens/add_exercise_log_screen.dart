import 'package:fitpal/constraints/constraints.dart';
import 'package:fitpal/widgets/custome_textform_field.dart';
import 'package:flutter/material.dart';

class AddExerciseLogScreen extends StatefulWidget {
  const AddExerciseLogScreen({super.key});

  @override
  State<AddExerciseLogScreen> createState() => _AddExerciseLogScreenState();
}

class _AddExerciseLogScreenState extends State<AddExerciseLogScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController foodNameController = TextEditingController();
  TextEditingController intensityController = TextEditingController();
  TextEditingController workoutTypeController = TextEditingController();

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
                  "Exercise Log",
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

              //* duration textform field
              Text(
                "Duration",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: durationController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* intensity  textform field
              Text(
                "Food name",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: intensityController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* workout type  textform field
              Text(
                "Workout type",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: workoutTypeController,
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
                    child: Text("Create",
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