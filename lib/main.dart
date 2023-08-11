// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bookstore/frontpages/login.dart';
import 'package:bookstore/src/features/beranda/view/beranda.dart';
import 'package:bookstore/src/features/book_read/readScreen.dart';
import 'package:bookstore/src/features/favorite/concept/favorite_fill1.dart';
import 'package:bookstore/src/features/favorite/view/favoriteScreen.dart';
import 'package:bookstore/src/features/profile/view/profileScreen.dart';
import 'package:bookstore/src/routing/screen_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'frontpages/spscreen1.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(GetMaterialApp(
    /*theme: TAppTheme.lightTheme,
    darkTheme: TAppTheme.darkTheme,
    themeMode: ThemeMode.system,*/
    // defaultTransition: Transition.leftToRightWithFade,
    // transitionDuration: Duration(milliseconds: 1000),

    debugShowCheckedModeBanner: false,
    initialRoute: '/read',
    routes: {
      '/start': (context) => MainScreen(),
      '/beranda': (context) => Beranda(),
      '/favorite': (context) => FavoriteScreen(),
      '/profile': (context) => ProfileScreen(),
      '/read': (context) => ReadScreen(),
      '/login': (context) => Login(),
      '/spscreen1': (context) => SplashScreen1(),

      // Concept
      '/favfill1': (context) => FavoriteScreenFill1(),
    },
  ));
}
