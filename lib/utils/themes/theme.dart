import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/utils/constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: primaryColor,
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
            fontSize: 28, fontWeight: FontWeight.bold, color: lightTextColor),
        displayMedium: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: lightTextColor,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: lightTextColor,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: lightTextColor,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: lightTextColor,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: lightTextColor,
        ),
        titleMedium: GoogleFonts.poppins(color: Colors.black54, fontSize: 20),
        titleSmall: GoogleFonts.poppins(color: Colors.black54, fontSize: 24),
        bodyLarge: GoogleFonts.poppins(
            fontSize: 14, fontWeight: FontWeight.normal, color: lightTextColor),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.normal, color: lightTextColor),
      ),
      appBarTheme: const AppBarTheme(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: whiteColor,
              backgroundColor: lightPrimaryColor,
              side: const BorderSide(color: lightPrimaryColor),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        foregroundColor: lightPrimaryColor,
        side: const BorderSide(color: lightPrimaryColor),
        padding: const EdgeInsets.symmetric(vertical: 8),
      )),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8),
      )));

  static ThemeData darkTheme = ThemeData(
      primarySwatch: primaryColor,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
            fontSize: 28, fontWeight: FontWeight.bold, color: darkTextColor),
        displayMedium: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: darkTextColor,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: darkTextColor,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: darkTextColor,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: darkTextColor,
        ),
        titleSmall: GoogleFonts.poppins(color: Colors.black54, fontSize: 24),
        bodyLarge: GoogleFonts.poppins(
            fontSize: 14, fontWeight: FontWeight.normal, color: darkTextColor),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.normal, color: darkTextColor),
      ),
      appBarTheme: const AppBarTheme(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: lightPrimaryColor,
              backgroundColor: whiteColor,
              side: const BorderSide(color: whiteColor),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              foregroundColor: whiteColor,
              side: const BorderSide(color: whiteColor),
              padding: const EdgeInsets.symmetric(vertical: 8))));
}
