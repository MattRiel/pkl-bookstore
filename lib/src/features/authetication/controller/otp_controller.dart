import 'package:bookstore/src/repository/authentication_repository/authentication_repository.dart';
import 'package:bookstore/src/routing/screen_routing.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(MainScreen()) : Get.back();
  }
}
