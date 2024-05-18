// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03, vertical: screenHeight * 0.005),
        child: Column(
          children: [
            //* row for  add section ---------------------------------------------
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
            //* ------------------------------------------------------------------------
            Flexible(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("nutrition_info")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text('No users found'));
                  } else {
                    List<DocumentSnapshot> nutrition = snapshot.data!.docs;
                    return SingleChildScrollView(
                      child: Container(
                        height: screenHeight * 0.675,
                        child: ListView.builder(
                            itemCount: nutrition.length,
                            itemBuilder: (cotext, index) {
                              Map<String, dynamic> nutrition_info =
                                  nutrition[index].data()
                                      as Map<String, dynamic>;

                              return Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.03,
                                          vertical: screenWidth * 0.02),
                                      height: screenHeight * 0.15,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: containerColor,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Date: ${nutrition_info["date"]} ",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.w600,
                                                textColor: darkTextColor,
                                                textSize: 15),
                                          ),
                                          Text(
                                            "Entry Number: ${nutrition_info["entry_number"]}",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.w600,
                                                textColor: darkTextColor,
                                                textSize: 15),
                                          ),
                                          Text(
                                            "Food Name:  ${nutrition_info["food_name"]}",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.w600,
                                                textColor: darkTextColor,
                                                textSize: 15),
                                          ),
                                          Text(
                                            "Nutrition intake:  ${nutrition_info["nutrition_intake"]}",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.w600,
                                                textColor: darkTextColor,
                                                textSize: 15),
                                          ),
                                          Text(
                                            "Total Calories Consumed: ${nutrition_info["calories_consumed"]}",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.bold,
                                                textColor: primaryColor,
                                                textSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                  }
                },
              ),
            ),
            //* ------------------------------------------------------------------------
          ],
        ),
      ),
    );
  }
}
