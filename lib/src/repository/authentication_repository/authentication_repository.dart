import 'package:bookstore/src/features/authetication/screens/welcome/welcome_screen.dart';
import 'package:bookstore/src/repository/authentication_repository/exception/login_email_password_failure.dart';
import 'package:bookstore/src/repository/authentication_repository/exception/signup_email_password_failure.dart';
import 'package:bookstore/src/routing/screen_routing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Autentik Firebase
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  // Check User if logged in

  @override
  void onReady() {
    // TODO: implement onReady
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const MainScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => MainScreen())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("Error firebase :${ex.message} ");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("Exception : ${ex.message}");
      throw ex;
    }
  }

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
