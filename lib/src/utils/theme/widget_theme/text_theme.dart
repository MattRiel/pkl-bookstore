import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._(); // menghindari penggunaan instance

  static TextTheme lightTextTheme = TextTheme(
      labelLarge: GoogleFonts.inter(
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.red,
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
      ));
  static TextTheme darkTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.white60,
        fontSize: 24,
      ));
}
