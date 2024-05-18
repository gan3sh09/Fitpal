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
