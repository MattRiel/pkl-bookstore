import 'package:bookstore/src/features/authetication/user_model.dart';
import 'package:bookstore/src/features/profile/controller/profile_controller.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../utils/const_widget/warning_snackbar.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
        appBar: AppBar(
          title: Text('Ubah Profil'),
          elevation: 0,
        ),
        body: Container(
          padding:
              EdgeInsets.symmetric(vertical: tFormHeight - 10, horizontal: 16),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Loading state
                return CircularProgressIndicator(); // You can use your own loading indicator
              } else if (snapshot.hasError) {
                // Error state
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Error loading user data',
                    style: TextStyle(
                        color: Colors.red), // Customize error text style
                  ),
                );
              } else if (snapshot.hasData) {
                // Data available state
                UserModel userData = snapshot.data as UserModel;
                return Form(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        child: CircleAvatar(
                          radius: 70,
                          child: Icon(
                            Icons.person_2_outlined,
                            size: 80,
                          ),
                        ),
                      ),
                      TextFormField(
                        initialValue: userData.fullName,
                        // Assuming 'fullName' is the user's name property
                        decoration: InputDecoration(
                          label: Text(tFullName),
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                      ),
                      SizedBox(
                        height: tFormHeight - 20,
                      ),
                      TextFormField(
                        initialValue: userData.email,
                        // Assuming 'email' is the user's email property
                        decoration: InputDecoration(
                          label: Text(tEmail),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(
                        height: tFormHeight - 20,
                      ),
                      TextFormField(
                        initialValue: userData.phoneNo,
                        // Assuming 'phoneNo' is the user's phone number property
                        decoration: InputDecoration(
                          label: Text(tPhoneNo),
                          prefixIcon: Icon(Icons.numbers),
                        ),
                      ),
                      SizedBox(
                        height: tFormHeight - 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        initialValue: userData.password,
                        decoration: InputDecoration(
                          label: Text(tPassword),
                          prefixIcon: Icon(Icons.fingerprint),
                        ),
                      ),
                      SizedBox(
                        height: tFormHeight - 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle update profile logic
                        },
                        child: Text('Ubah Profile'),
                      ),
                      Text(
                        "Terdaftar pada : Tanggal 20 Maret",
                        style: TextStyle(color: Colors.green[200]),
                      ),
                      tHeightSpace(24),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {
                          warningDev();
                        },
                        child: Text('Hapus akun'),
                      )
                    ],
                  ),
                );
              } else {
                // Empty state
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'No data available',
                    style: TextStyle(
                        color: Colors.grey), // Customize empty state text style
                  ),
                );
              }
            },
          ),
        ));
  }
}
