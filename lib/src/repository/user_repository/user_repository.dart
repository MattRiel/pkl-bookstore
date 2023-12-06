import 'package:bookstore/src/features/authetication/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUserAndStoreInFirestore(UserModel user) async {
    try {
      // Create user in Firebase Authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // Retrieve the current user after authentication
      final currentUser = FirebaseAuth.instance.currentUser;

      // Store user data in Firestore
      if (currentUser != null) {
        await _db.collection("Users").doc(currentUser.uid).set(user.toJson());
        Get.snackbar(
          "Berhasil",
          'Akun anda berhasil dibuat',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan. Coba lagi',
        snackPosition: SnackPosition.BOTTOM,
      );
      print(error.toString());
    }
  }

  // fetch 1 user
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    print(userData.fullName.toString());
    return userData;
  }

  // fetch semua user
  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
