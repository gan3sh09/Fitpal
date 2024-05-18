// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/form_validation/formValidation.dart';
import 'package:fitpal/model/update_user.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //* form key for form validation
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bodyType = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    bodyType.dispose();
    heightController.dispose();
    weightController.dispose();
    caloriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: const Text(
            "Edit User Info",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.005),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* textform fields starts from heree --------------------------------

                  //* First name textform field
                  const Text(
                    "First Name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  /* CustomTextFormField(
                    controller: firstNameController,
                    keyboardType: TextInputType.name,
                  ), */
                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: firstNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(),
                  ),

                  SizedBox(
                    height: screenHeight * 0.005,
                  ),

                  //* last name textform field
                  const Text(
                    "Last Name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  /* CustomTextFormField(
                    controller: lastNameController,
                    keyboardType: TextInputType.name,
                  ), */

                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: lastNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  //* mobile  textform field
                  const Text(
                    "Body Type",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  /* CustomTextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                  ), */
                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: bodyType,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  //* current height  textform field
                  const Text(
                    "Current Height",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  /* CustomTextFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                  ), */
                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: heightController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(),
                  ),
                  //* current weight  textform field
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  const Text(
                    "Current Weight",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  /* CustomTextFormField(
                    controller: widthController,
                    keyboardType: TextInputType.number,
                  ), */
                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: weightController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(),
                  ),
                  //* calories intake textform field
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  const Text(
                    "Calories intake",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  /* CustomTextFormField(
                    controller: caloriesController,
                    keyboardType: TextInputType.number,
                  ), */
                  TextFormField(
                    validator: Validators.validateinputFields,
                    controller: caloriesController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  //*Save button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
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
                          if (_formKey.currentState!.validate()) {
                            final user = UpdateUser(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              body: bodyType.text,
                              height: heightController.text,
                              weight: weightController.text,
                              calory: caloriesController.text,
                            );
                            createUser(user);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: primaryColor,
                                content: const Text(
                                  'User added successfully!',
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                            );
                          }
                          Navigator.pop(context); // Close the dialog
                        });
                      },
                      child: const Text('Save'),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
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
                          if (_formKey.currentState!.validate()) {
                            UpdateUser updatedUser = UpdateUser(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              body: bodyType.text,
                              height: heightController.text,
                              weight: weightController.text,
                              calory: caloriesController.text,
                            );

                            updateUser(updatedUser).then((_) {
                              // Handle successful update
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: primaryColor,
                                  content: const Text(
                                    'User updated successfully!',
                                    style: TextStyle(color: whiteColor),
                                  ),
                                ),
                              );
                            }).catchError((error) {
                              // Handle errors
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Failed to update: $error'),
                                ),
                              );
                            });
                          }
                          Navigator.pop(context); // Close the dialog
                        });
                      },
                      child: const Text('Update'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future createUser(UpdateUser user) async {
    final docUser =
        FirebaseFirestore.instance.collection('updatedUser').doc('my-id');
    user.id = docUser.id;

    final json = user.toJson();

    await docUser.set(json);
  }

  Future<void> updateUser(UpdateUser user) async {
    final docUser =
        FirebaseFirestore.instance.collection('updatedUser').doc('my-id');

    final json = user.toJson();

    await docUser.update(json);
  }
}
