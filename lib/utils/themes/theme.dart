import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/utils/color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: primaryColor,
      brightness: Brightness.light,
      textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
              fontSize: 28, fontWeight: FontWeight.bold, color: lightTextColor),
          headline2: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: lightTextColor,
          ),
          headline3: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: lightTextColor,
          ),
          headline4: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: lightTextColor,
          ),
          headline6: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: lightTextColor,
          ),
          subtitle2: GoogleFonts.poppins(color: Colors.black54, fontSize: 24),
          bodyText1: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: lightTextColor)),
      appBarTheme: AppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: whiteColor,
              backgroundColor: lightPrimaryColor,
              side: BorderSide(color: lightPrimaryColor),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              foregroundColor: lightPrimaryColor,
              side: BorderSide(color: lightPrimaryColor),
              padding: EdgeInsets.symmetric(vertical: 8))));

  static ThemeData darkTheme = ThemeData(
      primarySwatch: primaryColor,
      brightness: Brightness.dark,
      textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
              fontSize: 28, fontWeight: FontWeight.bold, color: darkTextColor),
          headline2: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: darkTextColor,
          ),
          headline3: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: darkTextColor,
          ),
          headline4: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: darkTextColor,
          ),
          headline6: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: darkTextColor,
          ),
          subtitle2: GoogleFonts.poppins(color: Colors.black54, fontSize: 24),
          bodyText1: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: darkTextColor)),
      appBarTheme: AppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: lightPrimaryColor,
              backgroundColor: whiteColor,
              side: BorderSide(color: whiteColor),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              foregroundColor: whiteColor,
              side: BorderSide(color: whiteColor),
              padding: EdgeInsets.symmetric(vertical: 8))));
}
