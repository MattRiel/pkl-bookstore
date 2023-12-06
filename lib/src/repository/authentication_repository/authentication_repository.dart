import 'package:bookstore/src/features/authetication/screens/welcome/welcome_screen.dart';
import 'package:bookstore/src/repository/authentication_repository/exception/login_email_password_failure.dart';
import 'package:bookstore/src/routing/screen_routing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../features/authetication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'exception/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Autentik Firebase
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  // Check User if logged in

  @override
  void onReady() {
    // TODO: implement onReady
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  // Gunakan ini untuk tes layar karena akan menimpa Home di main.dart
  _setInitialScreen(User? user) {
    // memastikan status pengguna login atau logout
    // user == null
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        //  : Get.offAll(() => const MainScreen());
        : Get.offAll(() => const MainScreen());
  }

  Future<void> registerUserWithPhoneNoAndPassword(
      String email, String password, String phoneNo) async {
    try {
      // Create a new user with email and password
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Initiate phone authentication
      await phoneAuthentication(phoneNo);

      // Navigate to OTPScreen
      Get.to(() => OTPScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("Error firebase: ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("Exception: ${ex.message}");
      throw ex;
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        // Store the verificationId if needed
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // Store the verificationId if needed
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Nomor tidak valid');
        } else {
          Get.snackbar('Error', 'Terdapat kesalahan. Coba lagi');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  // Login Akun
  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final errorMessage =
          LoginWithEmailAndPasswordFailure.code(e.code).message;

      // Show a Snackbar with the error message
      Get.snackbar(
        'Login Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1000),
        animationDuration: const Duration(milliseconds: 200),
      );

      // Throw the actual exception for further handling
      throw LoginWithEmailAndPasswordFailure(message: errorMessage);
    } catch (error) {
      // Handle other unexpected errors

      // Show a Snackbar with a generic error message
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1000),
        animationDuration: const Duration(milliseconds: 200),
      );

      // Rethrow the exception for further handling
      rethrow;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
