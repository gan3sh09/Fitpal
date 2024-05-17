import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class EditProfileScreen extends StatefulWidget {
  String? id;
  EditProfileScreen({super.key, this.id});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final caloriesController = TextEditingController();
  //*
  String userId = "";
  void _initializeFirebase() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      userId = user!.uid;
      print("userid:" + userId);
    });
    // Retrieve user information from Firestore and set the controllers
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('User_info')
        .doc(userId)
        .get();
    if (userSnapshot.exists) {
      firstNameController.text = userSnapshot['first_name'] ?? "N/A";
      lastNameController.text = userSnapshot['last_name'] ?? "N/A";
      contactController.text = userSnapshot['contact'] ?? "N/A";
      heightController.text = userSnapshot['height'] ?? "N/A";
      widthController.text = userSnapshot['weight'] ?? "N/A";
      caloriesController.text = userSnapshot['calories'] ?? "N/A";
    }
  }

  void _updateUserInfo() async {
    try {
      await FirebaseFirestore.instance
          .collection('User_info')
          .doc(userId)
          .update({
        "first_name": firstNameController.text,
        "last_name": firstNameController.text,
        "contact": firstNameController.text,
        "height": firstNameController.text,
        "weight": firstNameController.text,
        "calories": firstNameController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User information updated successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating user information')),
      );
    }
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
                  "Contact Number",
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
                  controller: contactController,
                  keyboardType: TextInputType.phone,
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
                  controller: heightController,
                  keyboardType: TextInputType.number,
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
                  controller: widthController,
                  keyboardType: TextInputType.number,
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
                  controller: caloriesController,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                //*Save button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        _initializeFirebase();
                        //* generating custome id
                        String Id = randomAlphaNumeric(5);
                        //* storing the user info in a single map
                        Map<String, dynamic> userInfoMap = {
                          "first_name": firstNameController.text,
                          "last_name": firstNameController.text,
                          "contact": firstNameController.text,
                          "height": firstNameController.text,
                          "weight": firstNameController.text,
                          "calories": firstNameController.text,
                        };
                        // await DatabaseMethods()
                        //     .updateUserInfo(Id, userInfoMap)
                        //     .then((value) {
                        //   Navigator.pop(context);
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       backgroundColor: Colors.green,
                        //       content: Text('User Updated Successfully'),
                        //     ),
                        //   );

                        // Map<String, dynamic> userInfoMap = {
                        //  "id":Id,
                        //   "first_name": firstNameController.text,
                        //   "last_name": lastNameController.text,
                        //   "contact": contactController.text,
                        //   "height": heightController.text,
                        //   "weight": widthController.text,
                        //   "calories": caloriesController.text,
                        // };
                        // await DatabaseMethods()
                        //     .addUserInfo(userInfoMap, Id)
                        //     .then((value) {
                        //   Navigator.pop(context);
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       backgroundColor: Colors.green,
                        //       content: Text('User Updated Successfully'),
                        //     ),
                        //   );
                        //   firstNameController.text = "";
                        //   lastNameController.text = "";
                        //   contactController.text = "";
                        //   heightController.text = "";
                        //   widthController.text = "";
                        //   caloriesController.text = "";
                        // });
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
