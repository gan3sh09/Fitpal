import 'package:fitpal/Controller/logout_controller.dart';
import 'package:fitpal/common_widget/nutrition_tracker_text.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/screens/exercise_log_screen/layout/add_exercise_log_screen.dart';
import 'package:fitpal/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class ExerciseLogScreen extends StatelessWidget {
  const ExerciseLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Exercise Log',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        backgroundColor: primaryColor,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: whiteColor,
            ),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: ((BuildContext context) {
              return [
                PopupMenuItem(
                  value: 1,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Are you sure you want to log out?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(false); // No button pressed
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(true); // Yes button pressed
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).then((value) {
                      if (value != null && value) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            );
                          },
                        );

                        // User confirmed logout, perform logout action
                        logOut();

                        Navigator.pop(context);

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                    });
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                )
              ];
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.005,
          ),
          child: Column(
            children: [
              //*title of the screen
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
                        builder: (context) => const AddExerciseLogScreen(),
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
                height: screenHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: containerColor,
                ),
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, index) {
                      return const ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //*date  text
                            NutritionTrackerText(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              text: "Date: 04/04/2024",
                              textColor: darkTextColor,
                            ),
                            //*duration  text
                            NutritionTrackerText(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              text: "Duration: 90 minutes",
                              textColor: darkTextColor,
                            ),
                            //*workout type text
                            NutritionTrackerText(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              text: "Workout Type: Full Body",
                              textColor: darkTextColor,
                            ),

                            //*Total calories consumed  text --------------------

                            NutritionTrackerText(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              text: "Total calories consumed : 105",
                              textColor: primaryColor,
                            ),
                            //*Calories burnt text
                            Divider(
                              thickness: 2,
                              color: Color(0xff9394a5),
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
