import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Goal',
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
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.005,
          ),
          child: Column(
            children: [
              //* Row for title and edit button
              //* howm text
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
                      "Set",
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

              SizedBox(
                height: screenHeight * 0.004,
              ),
              //*user current status
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenWidth * 0.02),
                height: screenHeight * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: containerColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //*Date   text
                    Text(
                      "Date: 04/04/2024",
                      style: kTextStyle.textStyle(
                        fontWeight: FontWeight.w600,
                        textColor: darkTextColor,
                        textSize: 15,
                      ),
                    ),
                    //*duration weight text
                    Text(
                      "Duration: 6 months",
                      style: kTextStyle.textStyle(
                        fontWeight: FontWeight.w600,
                        textColor: darkTextColor,
                        textSize: 15,
                      ),
                    ),
                    //*current weight text
                    Text(
                      "Current Weight: 45kg",
                      style: kTextStyle.textStyle(
                        fontWeight: FontWeight.w600,
                        textColor: darkTextColor,
                        textSize: 15,
                      ),
                    ),
                    //*Target weight text
                    Text(
                      "Target Weight: 55kg",
                      style: kTextStyle.textStyle(
                        fontWeight: FontWeight.w600,
                        textColor: darkTextColor,
                        textSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.001,
                    ),
                    //* Todo burnt text ---------------------------------
                    Text(
                      "To do:",
                      style: kTextStyle.textStyle(
                        fontWeight: FontWeight.bold,
                        textColor: primaryColor,
                        textSize: 17,
                      ),
                    ),
                    //*  text
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.014),
                      child: RichText(
                        text: TextSpan(
                          style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15,
                          ),
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
                                  'Calculate daily calories intake to ensure a surplus for gradual weight gain',
                              style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.014),
                      child: RichText(
                        text: TextSpan(
                          style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15,
                          ),
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
                                  'Calculate daily calories intake to ensure a surplus for gradual weight gain',
                              style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.014),
                      child: RichText(
                        text: TextSpan(
                          style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15,
                          ),
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
                                  'Calculate daily calories intake to ensure a surplus for gradual weight gain',
                              style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.014),
                      child: RichText(
                        text: TextSpan(
                          style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15,
                          ),
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
                                  'Calculate daily calories intake to ensure a surplus for gradual weight gain',
                              style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.014),
                      child: RichText(
                        text: TextSpan(
                          style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15,
                          ),
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
                                  'Calculate daily calories intake to ensure a surplus for gradual weight gain',
                              style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.014),
                      child: RichText(
                        text: TextSpan(
                          style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15,
                          ),
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
                                  'Calculate daily calories intake to ensure a surplus for gradual weight gain',
                              style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.008,
              ),

              SizedBox(
                height: screenHeight * 0.008,
              ),
              //*today's workout plan   section ---------------------------------------------------------------
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenWidth * 0.02),
                height: screenHeight * 0.20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: containerColor,
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
                        textSize: 17,
                      ),
                    ),
                    //*bench press  text
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
