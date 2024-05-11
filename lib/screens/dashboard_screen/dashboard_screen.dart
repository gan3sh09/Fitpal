import 'package:fitpal/Controller/logout_controller.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
