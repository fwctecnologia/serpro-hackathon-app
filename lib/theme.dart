import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color kBlueDefault = Color(0xFF0d2237);
  static const Color kBlueRoyal = Color(0xff050f18);
  static Color kBlack = const Color(0xFF000000).withOpacity(0.8);

  static ThemeData light({Color? color}) => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppTheme.kBlack,
          ),
        ),
        disabledColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.5),
            minimumSize: MaterialStateProperty.all(const Size(0, 55)),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(kBlueDefault),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.lato(fontSize: 16, color: kBlack),
          bodyMedium: GoogleFonts.lato(fontSize: 12, color: kBlack),
          bodySmall: GoogleFonts.lato(fontSize: 10, color: kBlack),
          displayLarge: GoogleFonts.sortsMillGoudy(fontSize: 26, color: kBlack),
          displayMedium:
              GoogleFonts.sortsMillGoudy(fontSize: 20, color: kBlack),
          displaySmall: GoogleFonts.lato(
            fontSize: 16,
            color: kBlack,
            fontWeight: FontWeight.w600,
          ),
          headlineLarge: GoogleFonts.lato(
            fontSize: 26,
            color: kBlack,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.lato(
            fontSize: 16,
            color: kBlack,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.lato(
            fontSize: 12,
            color: kBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: kBlack),
        primaryIconTheme: IconThemeData(color: kBlack),
      );
}
