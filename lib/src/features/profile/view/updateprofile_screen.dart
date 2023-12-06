import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../utils/const_widget/warning_snackbar.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ubah Profil'),
          elevation: 0,
        ),
        body: Container(
          padding:
              EdgeInsets.symmetric(vertical: tFormHeight - 10, horizontal: 16),
          child: Form(
            // key: _formKey,
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
                  // controller: controller.fullName,
                  decoration: InputDecoration(
                      label: Text(tFullName),
                      prefixIcon: Icon(Icons.person_outline_rounded)),
                ),
                SizedBox(
                  height: tFormHeight - 20,
                ),
                TextFormField(
                  // controller: controller.email,
                  decoration: InputDecoration(
                      label: Text(tEmail),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                SizedBox(
                  height: tFormHeight - 20,
                ),
                TextFormField(
                  // controller: controller.phoneNo,
                  decoration: InputDecoration(
                      label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
                ),
                SizedBox(
                  height: tFormHeight - 20,
                ),
                TextFormField(
                  // controller: controller.password,
                  decoration: InputDecoration(
                      label: Text(tPassword),
                      prefixIcon: Icon(Icons.fingerprint)),
                ),
                SizedBox(
                  height: tFormHeight - 10,
                ),
                ElevatedButton(
                  onPressed: () {},
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
          ),
        ));
  }
}
