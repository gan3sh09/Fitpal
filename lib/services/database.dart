import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  //* function to add new user to the database
  Future addUserInfo(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("User_info")
        .doc(id)
        .set(userInfoMap);
  }

  //* function to fetch data from firebae database
  Future<Stream<QuerySnapshot>> getUserInfoDetails() async {
    return await FirebaseFirestore.instance.collection("User_info").snapshots();
  }

  //*update  user info
  Future updateUserInfo(String id, Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("user_info")
        .doc(id)
        .update(userInfoMap);
  }

  //* function to add nutrition to the database
  Future addNutritionInfo(Map<String, dynamic> nutritionInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("nutrition_info")
        .doc(id)
        .set(nutritionInfo);
  }

  //* function to add nutrition to the database
  Future addExerciseLogInfo(
      Map<String, dynamic> exerciseLogInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("exercise_log_info")
        .doc(id)
        .set(exerciseLogInfo);
  }

  //* function to set goal  to the database
  Future setGoalInfo(Map<String, dynamic> goalInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("goal_info")
        .doc(id)
        .set(goalInfoMap);
  }
}
