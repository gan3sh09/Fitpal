// ignore_for_file: unused_local_variable

import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/screens/dashboard_screen/dashboard_screen.dart';
import 'package:fitpal/screens/exercise_log_screen/exercise_log_screen.dart';
import 'package:fitpal/screens/goal_screen/goal_screen.dart';
import 'package:fitpal/screens/nutrition_tracker_screen/nutrition_tracker_screen.dart';
import 'package:fitpal/screens/social_screen/social_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    super.key,
  });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  //*index for navigation button selection
  int index = 0;
  //*navigation screens
  final screens = [
    const DashboardScreen(),
    const NutritionTrackerScreen(),
    const ExerciseLogScreen(),
    const GoalScreen(),
    const SocialScreen(),
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
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 9,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
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
              label: "Nutrition Tracker",
            ),
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
              label: "Exercise log",
            ),
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
              label: "Goal",
            ),
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
              label: "Social",
            ),
          ],
        ),
      ),
    );
  }
}
