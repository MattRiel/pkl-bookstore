// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 2000),
                top: splashController.animate.value ? 0 : -30,
                left: splashController.animate.value ? 0 : -30,
                child: Image(
                  image: AssetImage(tSplashTopIcon),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: Duration(milliseconds: 1600),
              top: 120,
              left: splashController.animate.value ? tDefaultSize : -80,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1800),
                opacity: splashController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      (tAppTagLine),
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 2400),
                bottom: splashController.animate.value ? 200 : 0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: AssetImage(tSplashImage),
                    ),
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 1800),
                bottom: splashController.animate.value ? 60 : 0,
                right: tDefaultSize,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1800),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Container(
                    width: tSplashContainerSize,
                    height: tSplashContainerSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: tPrimaryColor),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
