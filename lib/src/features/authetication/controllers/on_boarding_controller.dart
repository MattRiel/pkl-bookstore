import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();

  RxInt currentPage = 0.obs;
  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: tOnBoardingImage1,
      title: tOnBoardingTitle1,
      subTitle: tOnBoardingSubtitle1,
      counterText: tOnBoardingCounter1,
      bgColor: tOnBoardingPage1Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: tOnBoardingImage2,
      title: tOnBoardingTitle2,
      subTitle: tOnBoardingSubtitle2,
      counterText: tOnBoardingCounter2,
      bgColor: tOnBoardingPage2Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: tOnBoardingImage3,
      title: tOnBoardingTitle3,
      subTitle: tOnBoardingSubtitle3,
      counterText: tOnBoardingCounter3,
      bgColor: tOnBoardingPage3Color,
    )),
  ];

  OnPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
