// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitpal/Controller/signupin_controller.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/sizes.dart';
import 'package:fitpal/screens/navigation_screen/navigation_screen.dart';
import 'package:fitpal/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool _isObscure = true;

  final _formkey = GlobalKey<FormState>();

  // login with email and password
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: _emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email cannot be empty";
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please enter a valid email");
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                _emailController.text = value!;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(),
            ),
            const SizedBox(
              height: formHeight - 10,
            ),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: _passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                RegExp regex = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return "Password cannot be empty";
                }
                if (!regex.hasMatch(value)) {
                  return ("please enter valid password min. 6 character");
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.text,
              obscureText: _isObscure,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
            const SizedBox(
              height: formHeight - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _signIn();
                },
                child: const Text('LOGIN'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account!",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      )); // Navigate to signup screen
                    });
                  },
                  child: const Text(
                    'SIGNUP',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) return;

    _showLoadingDialog(context);
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _auth.signInWithEmailAndPassword(context, email, password);

    if (user != null) {
      print('Login sucessfully');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const NavigationScreen(),
      ));
    } else {
      print('some error occured.');
    }
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
    );
  }
}
