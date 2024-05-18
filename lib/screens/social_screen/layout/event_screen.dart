import 'package:fitpal/constants/colors.dart';
import 'package:fitpal/constants/constraints.dart';
import 'package:fitpal/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
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
            "Events",
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
                  child: Image.asset(eventImage),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.75,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          _follow ? 'Events' : 'Following',
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: screenHeight * 0.25,
                  width: double.infinity,
                  child: Image.asset(bicycleImage),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "20 Km Cycling event for charity!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: darkTextColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.01),
                  height: screenHeight * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFe4e5f1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date: 06/06/2024",
                        style: kTextStyle.textStyle(
                          fontWeight: FontWeight.w600,
                          textColor: darkTextColor,
                          textSize: 15,
                        ),
                      ),
                      Text(
                        "Location: Surry Hills",
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
