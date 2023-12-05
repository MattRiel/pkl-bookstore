import 'package:bookstore/firebase_options.dart';
import 'package:bookstore/src/features/authetication/screens/welcome/welcome_screen.dart';
import 'package:bookstore/src/repository/authentication_repository/authentication_repository.dart';
import 'package:bookstore/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/features/favorite/controller/favorite_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Cek firebase sesuai dengan platform yang digunakan
  // Ketika aplikasi dijalankan:
  // 1. firebase diinisialisasi
  // 2. authentikasi repositori dijalankan
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(GetMaterialApp(
    theme: TAppTheme.lightTheme,
    darkTheme: TAppTheme.darkTheme,
    themeMode: ThemeMode.system,
    initialBinding: InitialBindings(),
    debugShowCheckedModeBanner: false,
    home: WelcomeScreen(),
  ));
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController()); // Initialize and register here
  }
}
