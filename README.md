# fitpal

A new Flutter project.

## join Event
```bash
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoinCommunityScreen extends StatefulWidget {
  const JoinCommunityScreen({super.key});

  @override
  State<JoinCommunityScreen> createState() => _JoinCommunityScreenState();
}

class _JoinCommunityScreenState extends State<JoinCommunityScreen> {
  bool _follow = true;

  @override
  void initState() {
    super.initState();
    _loadFollowState();
  }

  _loadFollowState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Use 'follow' as a key to store and fetch the boolean value
      _follow = prefs.getBool('follow') ?? true; // Default to true if not set
    });
  }

  _saveFollowState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('follow', value);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

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
            "Join Our Community",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03, vertical: screenHeight * 0.005),
            child: Column(
              children: [
                //* community group image
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  child: Image.asset("assets/images/gym_group.png"),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.75,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          _follow ? 'Blogs' : 'Following',
                          style: const TextStyle(
                            color: whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.15,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _follow = !_follow;
                            _saveFollowState(_follow);
                          });
                        },
                        child: Icon(
                          _follow ? Icons.add : Icons.check,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenWidth * 0.02),
                  height: screenHeight * 0.24,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFe4e5f1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Embrace the journey to a healthier you! Fitness isn't just about the destination. It's about the daily commitment to move, nourish, and thrive. Wheather it's brisk walk, a nutrition meal, or a moment of mindfullness, every small step counts. Start today and let your fitness journey unfold....",
                        style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15,
                        ),
                      ),
                      Text(
                        "- George",
                        style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(logoImage),
                      height: size.height * 0.12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


```

## update_user.dart
```bash
class UpdateUser {
  String id;
  final String firstName;
  final String lastName;
  final String body;
  final String height;
  final String weight;
  final String calory;

  UpdateUser({
    this.id = '',
    required this.firstName,
    required this.lastName,
    required this.body,
    required this.height,
    required this.weight,
    required this.calory,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'body': body,
        'height': height,
        'weight': weight,
        'calory': calory,
      };

  static UpdateUser fromJson(Map<String, dynamic> json) => UpdateUser(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        body: json['body'],
        height: json['height'],
        weight: json['weight'],
        calory: json['calory'],
      );
}

```

## edit_profile_screen.dart
```bash
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpal/model/update_user.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                  controller: weightController,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
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
                        print('User successfully updated.');
                      }).catchError((error) {
                        // Handle errors
                        print('Failed to update user: $error');
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

```

## dashboard_screen.dart
```bash
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpal/Controller/logout_controller.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/model/update_user.dart';
import 'package:fitpal/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:fitpal/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

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
              //* Row for title and edit button
              //* Edit elevated button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: const AssetImage(logoImage),
                    height: size.height * 0.08,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //* navigate to edit profile screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
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
                            BorderRadius.circular(15), // Button border radius
                      ),
                    ),
                    child: Text(
                      "Edit",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w700,
                          textColor: whiteColor,
                          textSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              //* user name
              StreamBuilder<List<UpdateUser>>(
                  stream: readUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Center(child: Text('No users found'));
                    } else {
                      final users = snapshot.data!.first;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Hello ${users.firstName}",
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.bold,
                                  textColor: darkTextColor,
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
                            height: screenHeight * 0.18,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFe4e5f1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //* status  text
                                Text(
                                  "Status:",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.bold,
                                      textColor: primaryColor,
                                      textSize: 17),
                                ),
                                //*Current height  text
                                Text(
                                  "Currrent Height: ${users.height}",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*Current weight text
                                Text(
                                  "Currrent Weight: ${users.weight}",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*body type text
                                Text(
                                  "Body Type: ${users.body}",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                                //*Calories intake text
                                Text(
                                  "Calories intake: ${users.calory}",
                                  style: kTextStyle.textStyle(
                                      fontWeight: FontWeight.w600,
                                      textColor: darkTextColor,
                                      textSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  }),

              SizedBox(
                height: screenHeight * 0.008,
              ),
              //*goal   section ---------------------------------------------------------------
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenWidth * 0.02),
                height: screenHeight * 0.21,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFe4e5f1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* goal  text
                    Text(
                      "Goal:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 17),
                    ),
                    //*Duration  text
                    Text(
                      "Duration: 3 months remaining",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Current weight text
                    Text(
                      "Currrent Weight: 60kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Target weight text
                    Text(
                      "Target Weight: 70kg",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Desired Outcomes text
                    Text(
                      "Desired Outcome:  Bulking",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15),
                    ),
                    //*Training requred text
                    Text(
                      "Training required: Muscle Strengthening, weight lifting",
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
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
                height: screenHeight * 0.20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFe4e5f1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* today's workout plan  text
                    Text(
                      "Today's workout plan:",
                      style: kTextStyle.textStyle(
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor,
                          textSize: 17),
                    ),
                    //*bemch press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Bench Press: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*incline dumbell press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Incline dumbell press: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Chest flyes  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Chest Flyes: 3 sets * 10-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Tricep Dips press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Tricep Dips: 4 sets * 8-10 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Tricep  pushdow dumbell press  text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text: 'Tricep Pushdowns: 3 sets * 10-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
                                  textSize: 15)),
                        ],
                      ),
                    ),
                    //*Overhead Tricep Extension text
                    RichText(
                      text: TextSpan(
                        style: kTextStyle.textStyle(
                            fontWeight: FontWeight.w600,
                            textColor: darkTextColor,
                            textSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '🟢 ',
                            style: kTextStyle.textStyle(
                                fontWeight: FontWeight.w600,
                                textColor: darkTextColor,
                                textSize: 12),
                          ),
                          TextSpan(
                              text:
                                  'Overhead Tricep Extension: 3 sets * 1-12 reps',
                              style: kTextStyle.textStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: darkTextColor,
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

  Stream<List<UpdateUser>> readUsers() => FirebaseFirestore.instance
      .collection('updatedUser')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map(
            (doc) => UpdateUser.fromJson(
              doc.data(),
            ),
          )
          .toList());
}

```


