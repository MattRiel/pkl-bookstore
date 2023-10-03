import 'package:bookstore/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: tPrimaryColor,
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: tWhatsappBgColor,
  );
}
