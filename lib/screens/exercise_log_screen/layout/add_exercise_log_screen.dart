import 'package:flutter/material.dart';

class AddExerciseLogScreen extends StatefulWidget {
  const AddExerciseLogScreen({super.key});

  @override
  State<AddExerciseLogScreen> createState() => _AddExerciseLogScreenState();
}

class _AddExerciseLogScreenState extends State<AddExerciseLogScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController foodNameController = TextEditingController();
  TextEditingController intensityController = TextEditingController();
  TextEditingController workoutTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
          "Add Exercise Log",
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

              //* date textform field

              const Text(
                "Date",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              TextFormField(
                controller: dateController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(),
              ),

              SizedBox(
                height: screenHeight * 0.005,
              ),

              //* duration textform field

              const Text(
                "Duration",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              TextFormField(
                controller: durationController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* intensity  textform field

              const Text(
                "Food name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              TextFormField(
                controller: intensityController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              //* workout type  textform field
              const Text(
                "Workout type",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              TextFormField(
                controller: workoutTypeController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
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
                      onPressed: () {},
                      child: const Text('Create'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
