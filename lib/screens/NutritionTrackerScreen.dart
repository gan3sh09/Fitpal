import 'package:fitpal/constraints/constraints.dart';
import 'package:fitpal/screens/add_nutrition_tracker_screen.dart';
import 'package:fitpal/widgets/nutrition_tracker_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionTrackerScreen extends StatelessWidget {
  const NutritionTrackerScreen({super.key});

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
              horizontal: screenWidth * 0.03, vertical: screenHeight * 0.005),
          child: Column(
            children: [
              //* Row for title and edit button
              //* Nutrition tracker text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    "Nutrition Tracker",
                    style: kTextStyle.textStyle(
                        fontWeight: FontWeight.bold,
                        textColor: themeColor,
                        textSize: 18),
                  ),
                  //* Edit elevated button
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                        onPressed: () {
                          //* navigate to edit profile screen
                          Get.to(const AddNutritionTrackerScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: themeColor,
                          backgroundColor:
                              const Color.fromARGB(255, 213, 209, 209),

                          elevation: 5, // Button elevation
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.015,
                              vertical: screenHeight * 0.008), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Button border radius
                          ),
                        ),
                        child: Text(
                          "Add",
                          style: kTextStyle.textStyle(
                              fontWeight: FontWeight.w700,
                              textColor: themeColor,
                              textSize: 16),
                        )),
                  ),
                ],
              ),

              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* user name
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Summary",
                  style: kTextStyle.textStyle(
                      fontWeight: FontWeight.bold,
                      textColor: themeColor,
                      textSize: 17),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              //*user current status
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenWidth * 0.02),
                height: screenHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 213, 209, 209)),
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //*date  text
                            const NutritionTrackerText(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              text: "Date: 04/04/2024",
                            ),
                            //*entry number  text
                            NutritionTrackerText(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              text: "Entry number: ${index + 1}",
                            ),
                            //*food name text
                            const NutritionTrackerText(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              text: "Food Name: Egg white",
                            ),
                            //*calories  text
                            const NutritionTrackerText(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              text: "Calories: 45",
                            ),
                            //*Total calories consumed  text --------------------

                            const NutritionTrackerText(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              text: "Total calories consumed : 105",
                            ),
                            //*Calories burnt text
                            const Divider(
                              thickness: 2,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }),
              ),

//*goal   section ---------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
