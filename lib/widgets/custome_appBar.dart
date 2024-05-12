import 'package:fitpal/constraints/constraints.dart';
import 'package:flutter/material.dart';

AppBar CustomeAppBar(double screenHeight, Icon? backIcon) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: screenHeight * 0.03,
      ),
    ),
    automaticallyImplyLeading: false,
    title: Text(
      "FitPal",
      style: kTextStyle.textStyle(
          fontWeight: FontWeight.bold, textColor: Colors.white, textSize: 22),
    ),
  );
}
