import 'package:bookstore/src/features/authetication/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

// Fungsi CRUD User akan dimulai di file ini
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Berhasil",
            'Akun anda berhasil dibuat',
            snackPosition: SnackPosition.BOTTOM,
          ),
        )
        .catchError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan. Coba lagi',
        snackPosition: SnackPosition.BOTTOM,
      );
      print(error.toString());
    });
  }

  // fetch 1 user
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
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
