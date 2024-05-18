import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/screens/goal_screen/set_goal_screen.dart';
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
                        builder: (context) => const SetGoalScreen(),
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
              ), //* Todo burnt text ---------------------------------
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "To do:",
                  style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: primaryColor,
                    textSize: 17,
                  ),
                ),
              ),
              //*  todo section ---------------------------------------------------------------------------
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.015,
                    horizontal: screenWidth * 0.028),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 211, 212, 217),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    RichText(
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
                    //*--------------------
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
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
                                'Focus on consuming nutrient-dense foods such as lean proteins, complex carbohydates, helathy fats. and frouits and vegetables',
                            style: kTextStyle.textStyle(
                              fontWeight: FontWeight.w600,
                              textColor: darkTextColor,
                              textSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
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
                                'Desing a structured workout including strength training  exercises targeting major muscle groups',
                            style: kTextStyle.textStyle(
                              fontWeight: FontWeight.w600,
                              textColor: darkTextColor,
                              textSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
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
                                'Aim for a gradual weight gain of approximately 0.5 kg per week to ensure healthy progress',
                            style: kTextStyle.textStyle(
                              fontWeight: FontWeight.w600,
                              textColor: darkTextColor,
                              textSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
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
                                'Monitor progress reguraly and adjust the diet and workout plan as needed to maintain a healthy lifestyle.',
                            style: kTextStyle.textStyle(
                              fontWeight: FontWeight.w600,
                              textColor: darkTextColor,
                              textSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
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
                                'Listen to your body, prioritize consistency, and practice patience throughout the process',
                            style: kTextStyle.textStyle(
                              fontWeight: FontWeight.w600,
                              textColor: darkTextColor,
                              textSize: 15,
                            ),
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
              //*user current status
              //* Stremabuilder ----------------------------------------------------------------------
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("goal_info")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text('No data found'));
                  } else {
                    List<DocumentSnapshot> goal = snapshot.data!.docs;
                    return Container(
                      height: screenHeight * 0.9,
                      child: ListView.builder(
                          itemCount: goal.length,
                          itemBuilder: (cotext, index) {
                            Map<String, dynamic> goalInfo =
                                goal[index].data() as Map<String, dynamic>;

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
                                      color: Color.fromARGB(255, 211, 212, 217),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date: ${goalInfo["date"]} ",
                                          style: kTextStyle.textStyle(
                                              fontWeight: FontWeight.w600,
                                              textColor: darkTextColor,
                                              textSize: 15),
                                        ),
                                        Text(
                                          "Duration: ${goalInfo["duration"]}",
                                          style: kTextStyle.textStyle(
                                              fontWeight: FontWeight.w600,
                                              textColor: darkTextColor,
                                              textSize: 15),
                                        ),
                                        Text(
                                          "Current Weight:  ${goalInfo["current_weight"]}",
                                          style: kTextStyle.textStyle(
                                              fontWeight: FontWeight.w600,
                                              textColor: darkTextColor,
                                              textSize: 15),
                                        ),
                                        Text(
                                          "Target weight:  ${goalInfo["target_weight"]}",
                                          style: kTextStyle.textStyle(
                                              fontWeight: FontWeight.w600,
                                              textColor: darkTextColor,
                                              textSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.005,
                                  ),
                                  //*8=
                                ],
                              ),
                            );
                          }),
                    );
                  }
                },
              ),
              //* Stremabuilder ----------------------------------------------------------------------
              // Container(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: screenWidth * 0.03,
              //       vertical: screenWidth * 0.02),
              //   height: screenHeight * 0.5,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: containerColor,
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         height: screenHeight * 0.001,
              //       ),

              //       //* -------------------------------------------------------------------
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: screenHeight * 0.008,
              // ),

              // SizedBox(
              //   height: screenHeight * 0.008,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
