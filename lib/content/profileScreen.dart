// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F7),
      appBar: AppBar(
        elevation: 0,
        actions: [profileTopBar(context)],
        backgroundColor: Color(0xFFF2F4F7),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
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
                                'Ariel Matius Surbakti',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'placeholder@students.usu.ac.id',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    buildButton("Notifikasi", Icons.toggle_on_rounded, () {}),
                    SizedBox(height: 24),
                    buildButton(
                        "Bantuan", Icons.arrow_forward_ios_rounded, () {}),
                    SizedBox(height: 24),
                    buildButton("Keluar", Icons.exit_to_app, () {}),
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

  Widget profileTopBar(BuildContext context) {
    return Container(
      color: Color(0xFFF2F4F7),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu_outlined,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Profil",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            CircleAvatar(
              backgroundColor: Color(0xFFF2F4F7),
              child: Icon(
                Icons.grid_view_outlined,
                color: Colors.black,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            IconButton(onPressed: onPressed, icon: Icon(icon)),
          ],
        ),
      ),
    );
  }
}
