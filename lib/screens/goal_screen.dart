import 'package:fitpal/constraints/constraints.dart';
import 'package:fitpal/screens/add_goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
              //* howm text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    "Goal",
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
                          Get.to(const AddGoalScreen());
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
                          "Set",
                          style: kTextStyle.textStyle(
                              fontWeight: FontWeight.w700,
                              textColor: themeColor,
                              textSize: 16),
                        )),
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
                height: screenHeight * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 213, 209, 209)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //*Date   text
                    Text(
                      "Date: 04/04/2024",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w500,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*duration weight text
                    Text(
                      "Duration: 6 months",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w500,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*current weight text
                    Text(
                      "Current Weight: 45kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w500,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*Target weight text
                    Text(
                      "Target Weight: 55kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w500,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    SizedBox(
                      height: screenHeight * 0.001,
                    ),
                    //* Todo burnt text ---------------------------------
                    Text(
                      "To do:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          textSize: 16),
                    ),
                    //*  text
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.014),
                      child: Column(
                        children: [
                          //*----------first to do list
                          RichText(
                            text: TextSpan(
                                style: kTextStyle.textStyle(
                                    fontWeight: FontWeight.w600,
                                    textColor: Colors.black,
                                    textSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '🟢 ',
                                    style: kTextStyle.textStyle(
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.black,
                                        textSize: 12),
                                  ),
                                  TextSpan(
                                      text:
                                          'Calculate daily calories intake to ensure a surplus for gradual weight gain',
                                      style: kTextStyle.textStyle(
                                          fontWeight: FontWeight.w600,
                                          textColor: Colors.black,
                                          textSize: 15)),
                                ]),
                          ),
                          //*----------second todo list
                          RichText(
                            text: TextSpan(
                                style: kTextStyle.textStyle(
                                    fontWeight: FontWeight.w600,
                                    textColor: Colors.black,
                                    textSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '🟢 ',
                                    style: kTextStyle.textStyle(
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.black,
                                        textSize: 12),
                                  ),
                                  TextSpan(
                                      text:
                                          'Focus on consuming nutrient-dense foods such as lean proteins, complex carbohydrates, healthy fatsm and fruts and vegetables',
                                      style: kTextStyle.textStyle(
                                          fontWeight: FontWeight.w600,
                                          textColor: Colors.black,
                                          textSize: 15)),
                                ]),
                          ),
                          //*----------third todo list
                          RichText(
                            text: TextSpan(
                                style: kTextStyle.textStyle(
                                    fontWeight: FontWeight.w600,
                                    textColor: Colors.black,
                                    textSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '🟢 ',
                                    style: kTextStyle.textStyle(
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.black,
                                        textSize: 12),
                                  ),
                                  TextSpan(
                                      text:
                                          'Desing a structured workout routine including strength training excercises targeting major muscle groups',
                                      style: kTextStyle.textStyle(
                                          fontWeight: FontWeight.w600,
                                          textColor: Colors.black,
                                          textSize: 15)),
                                ]),
                          ),
                          //*----------fourth todo list
                          RichText(
                            text: TextSpan(
                                style: kTextStyle.textStyle(
                                    fontWeight: FontWeight.w600,
                                    textColor: Colors.black,
                                    textSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '🟢 ',
                                    style: kTextStyle.textStyle(
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.black,
                                        textSize: 12),
                                  ),
                                  TextSpan(
                                      text:
                                          "Aim for a gradual weight gain of approximately 0.5 kg per week to ensure healthy progress",
                                      style: kTextStyle.textStyle(
                                          fontWeight: FontWeight.w600,
                                          textColor: Colors.black,
                                          textSize: 15)),
                                ]),
                          ),
                          //*----------fifth todo list
                          RichText(
                            text: TextSpan(
                                style: kTextStyle.textStyle(
                                    fontWeight: FontWeight.w600,
                                    textColor: Colors.black,
                                    textSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '🟢 ',
                                    style: kTextStyle.textStyle(
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.black,
                                        textSize: 12),
                                  ),
                                  TextSpan(
                                      text:
                                          "Listen to your body, prioritize consisentency, and practice patience throughout the process",
                                      style: kTextStyle.textStyle(
                                          fontWeight: FontWeight.w600,
                                          textColor: Colors.black,
                                          textSize: 15)),
                                ]),
                          ),
                        ],
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
                height: screenHeight * 0.19,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 213, 209, 209)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* today's workout plan  text
                    Text(
                      "Today's workout plan:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          textSize: 17),
                    ),
                    //*bemch press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Bench Press: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*incline dumbell press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Incline dumbell press: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Chest flyes  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Chest Flyes: 3 sets * 10-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Tricep Dips press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Tricep Dips: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Tricep  pushdow dumbell press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Tricep Pushdowns: 3 sets * 10-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Overhead Tricep Extension text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                textSize: 12),
                          ),
                          TextSpan(
                              text:
                                  'Overhead Tricep Extension: 3 sets * 1-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
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
