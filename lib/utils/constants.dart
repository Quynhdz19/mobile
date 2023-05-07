import 'package:flutter/material.dart';
import 'package:mobile_front_end/models/languages/language_model.dart';

//colors for light theme
const textColor = Colors.white;
const primaryColor = Colors.blue;
const lightPrimaryColor = Color(0xFF42A5F4);
const lightBackgroundColor = Color(0xFFE3F2FD);
const whiteColor = Color(0xDFFFFFFF);
const redColor = Color(0xFFEF5350);
const greenColor = Color(0xFF66BB6A);
const orangeColor = Color(0xFFFFA726);
const blueColor = Color(0xFF1E88E5);
const greyColor = Colors.grey;
const favoriteColor = Color.fromRGBO(11,79,123,1);
const choiceWorkColor = Color.fromRGBO(89, 142, 222, 1);
const choiceWorkBackgroundColor = Color.fromRGBO(250, 235, 201, 0.8);

// light theme
const lightTextColor = Colors.black87;

const Map<int, Color> _lightBlueMap = {
  50: Color(0xFFE1F5FE),
  100: Color(0xFFB3E5FC),
  200: Color(0xFF81D4FA),
  300: Color(0xFF4FC3F7),
  400: Color(0xFF29B6F6),
  500: Color(0xFF03A9F4),
  600: Color(0xFF039BE5),
  700: Color(0xFF0288D1),
  800: Color(0xFF0277BD),
  900: Color(0xFF01579B),
};

final MaterialColor _lightBlueSwatch = MaterialColor(Colors.lightBlue.value, _lightBlueMap);

// dark theme
const darkBGColor = Color(0xFF37474F);
const darkPrimaryColor = Color(0xFF81D4FA);
const swatchColor = Colors.lightBlue;
const darkTextColor = Colors.black38;
const darkTextColor2 = Colors.white;

//scramble color
const scrambleGreenColor = Color.fromRGBO(83, 117, 121, 1);
const scrambleLightColor = Color.fromRGBO(159, 204, 195, 1);
const scrambleBoxColor = Color.fromRGBO(255, 210, 169, 1);

//calendar color
const calendarColor = Color.fromRGBO(76,98,118, 1);
//padding
const double defaultPadding = 20.0;