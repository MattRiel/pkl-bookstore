// Simpan data ke Firestore
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String phoneNo;
  final String password;

  UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  // Konversi data ke JSON
  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  // Fetch data dari Firebase

  // Map user ke dalam model
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // if null, then use !
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullname: data["FullName"],
        email: data["Email"],
        phoneNo: data["Phone"],
        password: data["Password"]);
  }
}
