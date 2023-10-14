import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color kDefaultColor = Color(0xFF73B89B);
  static const Color kScaffoldColor = Color(0xFFE8F3EE);
  static const Color kLightGreen = Color(0xff63726B);
  static const Color kDarkGreen = Color(0xFF20342B);
  static Color kBlack = const Color(0xFF000000).withOpacity(0.8);

  static ThemeData light({Color? color}) => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppTheme.kBlack,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFFE8F3EE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
        ),
        disabledColor: Colors.black,
        scaffoldBackgroundColor: const Color(0xFFE8F3EE),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dialogBackgroundColor: Colors.white,
        hintColor: Colors.black.withOpacity(0.16),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.16),
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: kDefaultColor,
          secondary: kLightGreen,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.5),
            minimumSize: MaterialStateProperty.all(const Size(0, 55)),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(kDefaultColor),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.robotoCondensed(
              fontSize: 16, color: kBlack, fontWeight: FontWeight.w500),
          bodyMedium: GoogleFonts.robotoCondensed(fontSize: 12, color: kBlack),
          bodySmall: GoogleFonts.robotoCondensed(fontSize: 10, color: kBlack),
          displayLarge: GoogleFonts.sortsMillGoudy(fontSize: 26, color: kBlack),
          displayMedium:
              GoogleFonts.sortsMillGoudy(fontSize: 20, color: kBlack),
          displaySmall: GoogleFonts.robotoCondensed(
            fontSize: 16,
            color: kBlack,
            fontWeight: FontWeight.w600,
          ),
          headlineLarge: GoogleFonts.robotoCondensed(
            fontSize: 26,
            color: kDarkGreen,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.robotoCondensed(
            fontSize: 16,
            color: kBlack,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.robotoCondensed(
            fontSize: 12,
            color: kBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: kBlack),
        primaryIconTheme: IconThemeData(color: kBlack),
      );
}
