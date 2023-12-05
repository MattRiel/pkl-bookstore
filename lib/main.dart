import 'package:bookstore/src/routing/screen_routing.dart';
import 'package:bookstore/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/features/favorite/controller/favorite_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(GetMaterialApp(
    theme: TAppTheme.lightTheme,
    darkTheme: TAppTheme.darkTheme,
    themeMode: ThemeMode.system,
    initialBinding: InitialBindings(),
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController()); // Initialize and register here
  }
}
