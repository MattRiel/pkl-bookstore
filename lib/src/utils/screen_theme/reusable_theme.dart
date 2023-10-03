import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ThemeUtils {
  static bool isDarkMode(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    return brightness == Brightness.dark;
  }

  static Color getBackgroundColor(BuildContext context) {
    return isDarkMode(context) ? tWhatsappBgColor : tWhiteColor;
  }

  static Color getNavbarBackgroundColor(BuildContext context) {
    return isDarkMode(context) ? tWhatsappNavColor : tPrimaryColor;
  }
}
