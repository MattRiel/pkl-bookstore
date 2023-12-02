// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import '../../features/authetication/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(Duration(milliseconds: 2000));
    Get.off(() => WelcomeScreen());
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
  }
}

// Jika tanpa GetX
// Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (context) => AppHome(),
//     ));
