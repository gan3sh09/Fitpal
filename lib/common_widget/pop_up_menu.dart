import 'package:flutter/material.dart';

class PopupMenuHelper {
  static PopupMenuButton<int> createPopupMenuButton(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: (value) {
        print(value);
      },
      itemBuilder: ((BuildContext context) {
        return [
          PopupMenuItem(
            value: 1,
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            onTap: () {
              _showLogoutDialog(context);
            },
          )
        ];
      }),
    );
  }

  static void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
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
                _performLogout(context);
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.blue, // Change color as per your theme
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void _performLogout(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Perform logout action
    // Replace this with your logout logic
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context); // Dismiss loading indicator
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
