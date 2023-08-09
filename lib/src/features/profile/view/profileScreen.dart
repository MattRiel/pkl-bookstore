// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/features/profile/controller/profile_controller.dart';
import 'package:bookstore/src/features/profile/model/profile_model.dart';
import 'package:bookstore/src/features/profile/widgets/profile_top_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_btn_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController _controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    final ProfileModel profileData = _controller.profileData;
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F7),
      appBar: AppBar(
        elevation: 0,
        actions: [profileTopBar()],
        backgroundColor: Color(0xFFF2F4F7),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 47,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: SizedBox(
                              height: 47,
                              width: 47,
                              child: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tProfileName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                tProfileEmail,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ProfileBtn(
                        text: "Notifikasi",
                        icon: Icons.toggle_on_rounded,
                        onPressed: () {}),
                    SizedBox(height: 24),
                    ProfileBtn(
                        text: "Bantuan",
                        icon: Icons.arrow_forward_ios_rounded,
                        onPressed: () {}),
                    SizedBox(height: 24),
                    ProfileBtn(
                        text: "Keluar",
                        icon: Icons.exit_to_app,
                        onPressed: () {}),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
