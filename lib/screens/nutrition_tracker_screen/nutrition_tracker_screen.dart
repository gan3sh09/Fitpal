import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/screens/nutrition_tracker_screen/layout/add_nutrition.dart';
import 'package:flutter/material.dart';

class NutritionTrackerScreen extends StatelessWidget {
  const NutritionTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Nutrition Tracker',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: whiteColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03, vertical: screenHeight * 0.005),
          child: Column(
            children: [
              //* Row for title and edit button
              //* Edit elevated button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: const AssetImage(logoImage),
                    height: size.height * 0.08,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //* navigate to Add Nutrition screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddNutritionScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: themeColor,
                      backgroundColor: primaryColor,

                      elevation: 5, // Button elevation
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.015,
                          vertical: screenHeight * 0.008), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Button border radius
                      ),
                    ),
                    child: Text(
                      "Add",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w700,
                          textColor: whiteColor,
                          textSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              //* user name
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Summary",
                  style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: darkTextColor,
                    textSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.004,
              ),
              //*user current status
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenWidth * 0.02),
                height: screenHeight * 0.24,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFe4e5f1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: 12/05/2024",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Entry Number: 1",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Food Name: Egg white",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Calories: 45",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Entry Number: 2",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Food Name: Banana",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Calories: 60",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Total Calories Consumed: 105",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.008,
              ),
              //*goal   section ---------------------------------------------------------------
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenWidth * 0.02),
                height: screenHeight * 0.24,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFe4e5f1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: 11/05/2024",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Entry Number: 1",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Food Name: Oats",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Calories: 50",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Entry Number: 2",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Food Name: Boiled Chicken",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Calories: 450",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Total Calories Consumed: 500",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.008,
              ),
              //*today's workout plan   section ---------------------------------------------------------------
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenWidth * 0.02),
                height: screenHeight * 0.16,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFe4e5f1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: 10/05/2024",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Entry Number: 1",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Food Name: Boiled Egg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Calories: 100",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    Text(
                      "Total Calories Consumed: 100",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
