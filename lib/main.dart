// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bookstore/src/routing/screen_routing.dart';
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
    /*theme: TAppTheme.lightTheme,
    darkTheme: TAppTheme.darkTheme,
    themeMode: ThemeMode.system,*/
    // defaultTransition: Transition.leftToRightWithFade,
    // transitionDuration: Duration(milliseconds: 1000),
    home: MainScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController()); // Initialize and register here
  }
}
