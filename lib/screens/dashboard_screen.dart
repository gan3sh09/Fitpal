import 'package:fitpal/constraints/constraints.dart';
import 'package:fitpal/screens/NutritionTrackerScreen.dart';
import 'package:fitpal/screens/edit_profile_screen.dart';
import 'package:fitpal/screens/exercise_log_screen.dart';
import 'package:fitpal/screens/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //*index for navigation button selection
  int index = 0;
  //*navigation screens
  final screens = [
    const DashboardScreen(),
    const NutritionTrackerScreen(),
    const ExerciseLogScreen(),
    const GoalScreen(),
    Container(
      child: Text("page 5"),
    ),

    //const UserForm(),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: screens[index],
      //Button navigation
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.grey,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500))),
        child: NavigationBar(
          backgroundColor: themeColor,
          selectedIndex: index,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            //* home navigator
            NavigationDestination(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white,
                size: screenHeight * 0.03,
              ),
              label: "Home",
            ),
            //*nutrition tracker navigator
            NavigationDestination(
                icon: const Icon(
                  Icons.analytics,
                  color: Colors.white,
                ),
                selectedIcon: Icon(
                  Icons.analytics,
                  color: Colors.white,
                  size: screenHeight * 0.03,
                ),
                label: "Nutrition Tracker"),
            //*Exercise log navigaror
            NavigationDestination(
                selectedIcon: const Icon(
                  Icons.notes,
                  color: Colors.white,
                ),
                icon: Icon(
                  Icons.notes,
                  color: Colors.white,
                  size: screenHeight * 0.03,
                ),
                label: "Exercise log"),
            //* goal navigator
            NavigationDestination(
                selectedIcon: const Icon(
                  Icons.track_changes_rounded,
                  color: Colors.white,
                ),
                icon: Icon(
                  Icons.track_changes_rounded,
                  color: Colors.white,
                  size: screenHeight * 0.03,
                ),
                label: "Goal"),
            //* social media navigator
            NavigationDestination(
                selectedIcon: const Icon(
                  Icons.groups_2_outlined,
                  color: Colors.white,
                ),
                icon: Icon(
                  Icons.groups_2_outlined,
                  color: Colors.white,
                  size: screenHeight * 0.03,
                ),
                label: "Social"),
          ],
        ),
      ),
    );
  }
}

//* -Dashboard screen -----------------------------

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                    "Home",
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
                          Get.to(const EditProfileScreen());
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
                          "Edit",
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
              //* user name
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hello Abinash!",
                  style: kTextStyle.textStyle(
                      fontWeight: FontWeight.bold,
                      textColor: Colors.black,
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
                height: screenHeight * 0.17,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 213, 209, 209)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* status  text
                    Text(
                      "Status:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          textSize: 17),
                    ),
                    //*Current height  text
                    Text(
                      "Currrent Height: 5.10",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*Current weight text
                    Text(
                      "Currrent Weight: 60kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*body type text
                    Text(
                      "Body Type: Slim",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*Calories intake text
                    Text(
                      "Calories intake: 2500",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*Calories burnt text
                    Text(
                      "Calories burnt: 1800",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
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
                height: screenHeight * 0.19,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 213, 209, 209)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* goal  text
                    Text(
                      "Goal:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          textSize: 17),
                    ),
                    //*Duration  text
                    Text(
                      "Duration: 3 months remaining",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*Current weight text
                    Text(
                      "Currrent Weight: 60kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*Target weight text
                    Text(
                      "Target Weight: 70kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*Desired Outcomes text
                    Text(
                      "Desired Outcome:  Bulking",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          textSize: 15),
                    ),
                    //*Training requred text
                    Text(
                      "Training required: Muscle Strengthening, weight lifting",
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
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
