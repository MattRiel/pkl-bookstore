import 'package:bookstore/src/constants/colors.dart';
import 'package:bookstore/src/utils/theme/widget_theme/appbar_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget_theme/elevated_button_theme.dart';
import 'widget_theme/outlined_button_theme.dart';

class TAppTheme {
  // private constructor
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
            color: tDarkColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          // Kategori, Buku Terbaru (Beranda)
          titleLarge: GoogleFonts.inter(
            color: tDarkColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: GoogleFonts.inter(
            color: const Color(0xFF282828),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          // book name in grid view
          bodyLarge: GoogleFonts.roboto(
            color: const Color(0xFF282828),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          // book author in grid view
          bodyMedium: GoogleFonts.roboto(
            color: const Color(0XFF7A7A7A),
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          //lihat semua text
          labelMedium: GoogleFonts.inter(
            color: const Color(0XFF7A7A7A),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
          headlineSmall: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: GoogleFonts.montserrat(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 18,
            color: Colors.grey[600],
          ),
          titleSmall: GoogleFonts.poppins(
            color: Colors.black54,
            fontSize: 24,
          )),
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme);
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
            color: tPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: GoogleFonts.inter(
            color: tWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: GoogleFonts.inter(
            color: const Color(0xFF282828),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          // book name in grid view
          bodyLarge: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          // book author in grid view
          bodyMedium: GoogleFonts.roboto(
            color: Colors.white24,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          // lihat semua text
          labelMedium: GoogleFonts.inter(
            color: tWhiteColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: GoogleFonts.montserrat(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.poppins(
            color: Colors.white60,
            fontSize: 24,
          )),
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme);
}
