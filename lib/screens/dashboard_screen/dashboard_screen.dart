import 'package:fitpal/Controller/logout_controller.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:fitpal/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        backgroundColor: primaryColor,
        actions: [
          TextButton(
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
                  logOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  )); // Navigate to login screen
                });
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ))
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
                      //* navigate to edit profile screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
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
                      "Edit",
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
                  "Hello Abinash!",
                  style: kTextStyle.textStyle(
                      fontWeight: FontWeight.bold,
                      textColor: darkTextColor,
                      textSize: 17),
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
                height: screenHeight * 0.20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFe4e5f1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* status  text
                    Text(
                      "Status:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 17),
                    ),
                    //*Current height  text
                    Text(
                      "Currrent Height: 5.10",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Current weight text
                    Text(
                      "Currrent Weight: 60kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*body type text
                    Text(
                      "Body Type: Slim",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Calories intake text
                    Text(
                      "Calories intake: 2500",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Calories burnt text
                    Text(
                      "Calories burnt: 1800",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
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
                height: screenHeight * 0.21,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFe4e5f1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* goal  text
                    Text(
                      "Goal:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 17),
                    ),
                    //*Duration  text
                    Text(
                      "Duration: 3 months remaining",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Current weight text
                    Text(
                      "Currrent Weight: 60kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Target weight text
                    Text(
                      "Target Weight: 70kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Desired Outcomes text
                    Text(
                      "Desired Outcome:  Bulking",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Training requred text
                    Text(
                      "Training required: Muscle Strengthening, weight lifting",
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
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
                height: screenHeight * 0.19,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFe4e5f1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* today's workout plan  text
                    Text(
                      "Today's workout plan:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 17),
                    ),
                    //*bemch press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Bench Press: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*incline dumbell press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Incline dumbell press: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Chest flyes  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Chest Flyes: 3 sets * 10-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Tricep Dips press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Tricep Dips: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Tricep  pushdow dumbell press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Tricep Pushdowns: 3 sets * 10-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Overhead Tricep Extension text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text:
                                  'Overhead Tricep Extension: 3 sets * 1-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
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
