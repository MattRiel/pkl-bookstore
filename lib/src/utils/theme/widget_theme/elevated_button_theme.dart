// ignore_for_file: prefer_const_constructors

import 'package:bookstore/src/utils/theme/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tSecondarycolor,
      side: BorderSide(color: tSecondarycolor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
      textStyle: TTextTheme.lightTextTheme.button,
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: tSecondarycolor,
      backgroundColor: tWhiteColor,
      side: BorderSide(color: tSecondarycolor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
