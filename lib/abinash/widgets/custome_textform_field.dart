import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextInputType? keyboardType;
  CustomTextFormField({super.key, required this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 225, 220, 220),
          borderRadius: BorderRadius.circular(9)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 3, horizontal: screenWidth * 0.02),
        child: TextFormField(
          //controler

          controller: controller,
          keyboardType: keyboardType,
          // validator: (value) {
          //   //validation
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter a username';
          //   } else if (value.length <= 5) {
          //     return "Username should be greater than 5 characters";
          //   } else {
          //     return null;
          //   }
          // },
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
