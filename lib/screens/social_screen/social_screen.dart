import 'package:fitpal/Controller/logout_controller.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/screens/login_screen/login_screen.dart';
import 'package:fitpal/screens/social_screen/layout/event_screen.dart';
import 'package:fitpal/screens/social_screen/layout/join_community_screen.dart';
import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Social',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage(logoImage),
                    height: size.height * 0.08,
                  ),
                ],
              ),

              //* community group image
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: screenHeight * 0.3,
                width: double.infinity,
                child: Image.asset("assets/images/gym_group.png"),
              ),
              //* join out community  text button
              /* GestureDetector(
                onTap: () {},
                child: Text(
                  "Join our Community",
                  style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: themeColor,
                    textSize: 16,
                  ),
                ),
              ), */
              ElevatedButton(
                onPressed: () {
                  //* navigate to Add Nutrition screen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const JoinCommunityScreen(),
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
                        BorderRadius.circular(12), // Button border radius
                  ),
                ),
                child: Text(
                  "Join Our Community",
                  style: kTextStyle.textStyle(
                    textColor: whiteColor,
                    textSize: 16,
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: screenHeight * 0.3,
                width: double.infinity,
                child: Image.asset("assets/images/join_event.jpg"),
              ),
              ElevatedButton(
                onPressed: () {
                  //* navigate to Add Nutrition screen
                  Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EventScreen(),
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
                        BorderRadius.circular(12), // Button border radius
                  ),
                ),
                child: Text(
                  "Events",
                  style: kTextStyle.textStyle(
                    textColor: whiteColor,
                    textSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
