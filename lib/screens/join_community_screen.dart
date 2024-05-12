import 'package:fitpal/constraints/constraints.dart';
import 'package:flutter/material.dart';

class JoinCommunityScreen extends StatelessWidget {
  const JoinCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FitPal",
          style: kTextStyle.textStyle(
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
              textSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03, vertical: screenHeight * 0.005),
          child: Column(
            children: [
              //* Row for title and edit button
              //* howm text

              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Social",
                  style: kTextStyle.textStyle(
                      fontWeight: FontWeight.bold,
                      textColor: themeColor,
                      textSize: 18),
                ),
              ),

              //* community group image
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: screenHeight * 0.3,
                width: double.infinity,
                child: Image.asset("assets/images/gym_group.png"),
              ),
              //* join out community  text button
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Join our Community",
                    style: kTextStyle.textStyle(
                        fontWeight: FontWeight.bold,
                        textColor: themeColor,
                        textSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
