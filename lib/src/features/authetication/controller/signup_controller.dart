import 'package:bookstore/src/repository/authentication_repository/authentication_repository.dart';
import 'package:bookstore/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/forget_password/forget_password_otp/otp_screen.dart';
import '../user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Buat instance user repo
  final userRepo = Get.put(UserRepository());

  // Textfield controller
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  Future<void> createUser(UserModel user) async {
    await userRepo.createUserAndStoreInFirestore(user);
    await AuthenticationRepository.instance.phoneAuthentication(user.phoneNo);
    Get.to(() => OTPScreen());
  }
}
