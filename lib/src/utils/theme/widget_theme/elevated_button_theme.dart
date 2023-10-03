// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: tBodyTextColor,
      backgroundColor: tCategoryButtonBg,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: tSecondarycolor,
      backgroundColor: tWhiteColor,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
