import 'package:fitpal/common_widget/form_header_widget.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/constants/sizes.dart';
import 'package:fitpal/screens/signup_screen/layouts/form_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(formHeight),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: logoImage,
                  title: 'Not registered yet, Sign Up!',
                ),
                FormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
