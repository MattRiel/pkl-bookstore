import 'package:bookstore/src/constants/colors.dart';
import 'package:bookstore/src/utils/const_widget/device_sizes.dart';
import 'package:flutter/material.dart';

import '../utils/screen_theme/reusable_theme.dart';

Widget allTopBar(BuildContext context, String title) {
  return Container(
    color: ThemeUtils.getNavbarBackgroundColor(context),
    width: deviceScreenWidth(context),
    child: Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu_outlined,
            color: ThemeUtils.isDarkMode(context) ? tPrimaryColor : tDarkColor,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          IconButton(
            splashColor: Colors.green[500],
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(Icons.people),
            color: ThemeUtils.isDarkMode(context) ? tPrimaryColor : tDarkColor,
          ),
        ],
      ),
    ),
  );
}
