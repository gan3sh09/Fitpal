// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpal/Controller/logout_controller.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:fitpal/screens/login_screen/login_screen.dart';
import 'package:fitpal/services/database.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //*to pass to edit screen
  late String user_id;
  //*function to fetch user info
  Stream? userInfoStream;
  getOnTheLoad() async {
    userInfoStream = await DatabaseMethods().getUserInfoDetails();
    setState(() {});
  }

  //*
  @override
  void initState() {
    super.initState();
    getOnTheLoad();
  }

  Widget userDetails() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: userInfoStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      height: 400,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Hello " + ds["first_name"],
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white
                                      .withOpacity(0.6), // Color of the shadow
                                  spreadRadius: 4, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: Offset(0, 1), // Offset of the shadow
                                ),
                              ],
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
                                  "Currrent Height: " + ds["height"],
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*Current weight text
                                Text(
                                  "Currrent Weight:" + ds["weight"],
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*body type text
                                Text(
                                  "Body Type: Slim",
                                  overflow: TextOverflow.fade,
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*Calories intake text
                                Text(
                                  "Calories intake:" + ds["calories"],
                                  overflow: TextOverflow.fade,
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
                        ],
                      ),
                    );
                  })
              : const SizedBox(child: Text("Loading..."));
        });
  }

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
      body:
          // Container(
          //     child: Column(
          //   children: [Expanded(child: userDetails()), Text("Hello")],
          // )),
          SingleChildScrollView(
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
                    height: screenHeight * 0.08,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //* navigate to edit profile screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
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
              //*---------------------------------------
              SizedBox(height: screenHeight * 0.25, child: userDetails()),

              //* ----------------------------------------------------------------------------

              //*goal   section ---------------------------------------------------------------
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenWidth * 0.02),
                height: screenHeight * 0.21,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.white.withOpacity(0.6), // Color of the shadow
                      spreadRadius: 4, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 1), // Offset of the shadow
                    ),
                  ],
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
                height: screenHeight * 0.20,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.white.withOpacity(0.6), // Color of the shadow
                      spreadRadius: 4, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 1), // Offset of the shadow
                    ),
                  ],
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
