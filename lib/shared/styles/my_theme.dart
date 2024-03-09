import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: darkBlueColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 12.sp, fontWeight: FontWeight.w500, color: darkGreyColor),
      titleMedium: GoogleFonts.inter(
        fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.black),
      titleLarge: GoogleFonts.inter(
        fontSize: 24.sp, fontWeight: FontWeight.w700, color: lightRedColor),
      bodyLarge: GoogleFonts.inter(
          fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white),
      bodyMedium: GoogleFonts.inter(
          fontSize: 16.sp, fontWeight: FontWeight.w500, color: greyColor),
      bodySmall: GoogleFonts.inter(
          fontSize: 14.sp, fontWeight: FontWeight.w700, color: darkGreyColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey.shade400,
      selectedItemColor: darkBlueColor,
    ),
  );
}
