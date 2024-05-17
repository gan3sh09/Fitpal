import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:fitpal/screens/exercise_log_screen/layout/add_exercise_log_screen.dart';
import 'package:flutter/material.dart';

class ExerciseLogScreen extends StatelessWidget {
  const ExerciseLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Exercise Log',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.005,
          ),
          child: Column(
            children: [
              //*title of the screen
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: const AssetImage(logoImage),
                    height: size.height * 0.08,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //* navigate to Add Nutrition screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddExerciseLogScreen(),
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
                      "Add",
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
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Summary",
                  style: kTextStyle.textStyle(
                    fontWeight: FontWeight.bold,
                    textColor: darkTextColor,
                    textSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.004,
              ),
              //*Exercise Log details ------------------------------------------------
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("exercise_log_info")
                    .snapshots(),
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
                    List<DocumentSnapshot> exercise_log = snapshot.data!.docs;
                    return SingleChildScrollView(
                      child: Container(
                        height: screenHeight * 0.9,
                        child: ListView.builder(
                            itemCount: exercise_log.length,
                            itemBuilder: (cotext, index) {
                              Map<String, dynamic> exercise_log_info =
                                  exercise_log[index].data()
                                      as Map<String, dynamic>;

                              return Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.03,
                                          vertical: screenWidth * 0.02),
                                      height: screenHeight * 0.15,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 211, 212, 217),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Date: ${exercise_log_info["date"]} ",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.w600,
                                                textColor: darkTextColor,
                                                textSize: 15),
                                          ),
                                          Text(
                                            "Duration: ${exercise_log_info["duration"]}",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.w600,
                                                textColor: darkTextColor,
                                                textSize: 15),
                                          ),
                                          Text(
                                            "Intensity:  ${exercise_log_info["intensity"]}",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.w600,
                                                textColor: darkTextColor,
                                                textSize: 15),
                                          ),
                                          Text(
                                            "Workout Type:  ${exercise_log_info["workout_type"]}",
                                            style: kTextStyle.textStyle(
                                                fontWeight: FontWeight.w600,
                                                textColor: darkTextColor,
                                                textSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                  }
                },
              ),
              //*Exercise Log details ------------------------------------------------

//*goal   section ---------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
