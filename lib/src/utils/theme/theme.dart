import 'package:flutter/material.dart';
import 'package:projectlogin/src/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:projectlogin/src/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:projectlogin/src/utils/theme/widget_theme/text_theme.dart';

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

// primarySwatch: MaterialColor(0xFFFFe200, <int, Color>{
// 50: Color(0x1affe200),
// 100: Color(0x33ffe200),
// 200: Color(0x4Dffe200),
// 300: Color(0x66ffe200),
// 400: Color(0x80ffe200),
// 500: Color(0xffffe200),
// 600: Color(0x99ffe200),
// 700: Color(0xb3ffe200),
// 800: Color(0xccffe200),
// 900: Color(0xe6ffe200),
// }
