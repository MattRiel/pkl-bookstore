// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: tSecondarycolor,
    floatingLabelStyle: TextStyle(color: tSecondarycolor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: tSecondarycolor,
      ),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: tPrimaryColor,
    floatingLabelStyle: TextStyle(color: tPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: tPrimaryColor,
      ),
    ),
  );
}
