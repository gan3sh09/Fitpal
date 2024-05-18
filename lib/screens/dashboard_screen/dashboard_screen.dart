// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpal/Controller/logout_controller.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/model/update_user.dart';
import 'package:fitpal/screens/dashboard_screen/workout_plan_widget.dart';
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
              //* user details info ------------------------------------------------------------------------------
              StreamBuilder<List<UpdateUser>>(
                  stream: readUsers(),
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
                      final users = snapshot.data!.first;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Hello ${users.firstName}",
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
                            height: screenHeight * 0.18,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: containerColor,
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
                                  "Currrent Height: ${users.height}",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*Current weight text
                                Text(
                                  "Currrent Weight: ${users.weight}",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*body type text
                                Text(
                                  "Body Type: ${users.body}",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*Calories intake text
                                Text(
                                  "Calories intake: ${users.calory}",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  }),
//* user details sectio end -----------------------------------------------------------------------------------
              SizedBox(
                height: screenHeight * 0.008,
              ),
              //*goal   section ---------------------------------------------------------------------------------

              //* Stremabuilder ----------------------------------------------------------------------
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("goal_info")
                    .orderBy("createdAt", descending: true)
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
                      height: screenHeight * 0.15,
                      child: ListView.builder(
                          itemCount: 1,
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
                                      color: containerColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //* status  text
                                        Text(
                                          "Goal:",
                                          style: kTextStyle.textStyle(
                                              fontWeight: FontWeight.bold,
                                              textColor: primaryColor,
                                              textSize: 17),
                                        ),
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
                                ],
                              ),
                            );
                          }),
                    );
                  }
                },
              ),
              //* goal secton ends --------------------------------------------------------------------
              SizedBox(
                height: screenHeight * 0.008,
              ),

              //*today's workout plan   section ---------------------------------------------------------------
              const TodaysWorkoutPlan(),
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<UpdateUser>> readUsers() => FirebaseFirestore.instance
      .collection('updatedUser')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map(
            (doc) => UpdateUser.fromJson(
              doc.data(),
            ),
          )
          .toList());
}
