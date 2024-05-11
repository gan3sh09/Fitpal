import 'package:fitpal/common_widget/form_header_widget.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/constants/sizes.dart';
import 'package:fitpal/screens/login_screen/layouts/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: logoImage,
                  title: "Welcome back!",
                ),
                LoginFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
