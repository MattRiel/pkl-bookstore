// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bookstore/src/features/authetication/screens/splash_screen/splash_screen.dart';
import 'package:bookstore/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/features/favorite/controller/favorite_controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(GetMaterialApp(
    initialBinding: InitialBindings(),
    // defaultTransition: Transition.leftToRightWithFade,
    // transitionDuration: Duration(milliseconds: 1000),
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController()); // Initialize and register here
  }
}
