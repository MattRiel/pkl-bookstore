import 'package:bookstore/src/features/authetication/user_model.dart';
import 'package:bookstore/src/repository/authentication_repository/authentication_repository.dart';
import 'package:bookstore/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/forget_password/forget_password_otp/otp_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Buat instance user repo
  final userRepo = Get.put(UserRepository());

  // Textfield controller
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  // Mengambil phoneNo dari user lalu passing ke Auth Repository menggunakan autentikasi firebase
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
