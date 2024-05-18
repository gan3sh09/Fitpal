import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:flutter/material.dart';

class TodaysWorkoutPlan extends StatelessWidget {
  const TodaysWorkoutPlan({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03, vertical: screenWidth * 0.02),
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
                    text: 'Overhead Tricep Extension: 3 sets * 1-12 reps',
                    style: kTextStyle.textStyle(
                        fontWeight: FontWeight.w600,
                        textColor: darkTextColor,
                        textSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
