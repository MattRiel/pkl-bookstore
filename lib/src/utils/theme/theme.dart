import 'package:flutter/material.dart';

import 'widget_theme/elevated_button_theme.dart';
import 'widget_theme/outlined_button_theme.dart';
import 'widget_theme/text_theme.dart';

class TAppTheme {
  // private constructor
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightElevatedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkElevatedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
