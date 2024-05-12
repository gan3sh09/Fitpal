import 'package:fitpal/constraints/constraints.dart';
import 'package:fitpal/widgets/custome_textform_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();

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
                  "Edit User Info",
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

              //* First name textform field
              Text(
                "First Name",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),
              CustomTextFormField(
                controller: firstNameController,
                keyboardType: TextInputType.name,
              ),

              SizedBox(
                height: screenHeight * 0.005,
              ),

              //* last name textform field
              Text(
                "Last Name",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: lastNameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* mobile  textform field
              Text(
                "Contact Number",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: mobileController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* current height  textform field
              Text(
                "Current Height",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),

              CustomTextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
              ),
              //* current weight  textform field
              SizedBox(
                height: screenHeight * 0.005,
              ),
              Text(
                "Current Weight",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),
              CustomTextFormField(
                controller: widthController,
                keyboardType: TextInputType.number,
              ),
              //* calories intake textform field
              SizedBox(
                height: screenHeight * 0.005,
              ),
              Text(
                "Calories intake",
                style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 15),
              ),
              CustomTextFormField(
                controller: caloriesController,
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
                    child: Text("Save",
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
