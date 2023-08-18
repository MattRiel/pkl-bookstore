// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            enableSideReveal: true,
            liquidController: obController.controller,
            onPageChangeCallback: obController.OnPageChangedCallback,
            slideIconWidget: Icon(Icons.arrow_back_ios),
          ),
          Positioned(
              bottom: 60,
              child: OutlinedButton(
                onPressed: () {
                  obController.animateToNextSlide();
                },
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.black26),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    onPrimary: Colors.white),
                child: Container(
                  padding: EdgeInsets.all((20)),
                  decoration: BoxDecoration(
                      color: Color(0xFF272727), shape: BoxShape.circle),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () {
                  obController.skip();
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.grey),
                ),
              )),
          Obx(
            () => Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  activeIndex: obController.currentPage.value,
                  count: 3,
                  effect: WormEffect(
                      activeDotColor: Color(0xFF272727), dotHeight: 5),
                )),
          )
        ],
      ),
    );
  }
}
