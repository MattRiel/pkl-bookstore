import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._(); // menghindari penggunaan instance

  static TextTheme lightTextTheme = TextTheme(
      headline2: GoogleFonts.montserrat(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 24,
      ));
  static TextTheme darkTextTheme = TextTheme(
      headline2: GoogleFonts.montserrat(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: GoogleFonts.poppins(
        color: Colors.white60,
        fontSize: 24,
      ));
}
