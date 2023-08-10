// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF1D2939),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Selamat Datang!",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                "Silahkan Masuk",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 316,
                  child: Image.asset('figma/login_pic.png')),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
                  children: [
                    // Buku Elektronik USU
                    Column(
                      children: [
                        // email
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          height: 36,
                          width: 295,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "NIM/NIP/USU's email",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // password
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          height: 36,
                          width: 295,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Masuk button
                    SizedBox(
                      width: 295,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFf04437),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        onPressed: () {
                          setState(() {
                            // Navigator.pushReplacementNamed(context, '/beranda');
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Masuk",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/beranda');
                        },
                        child: Text(
                          'Lanjutkan tanpa akun.',
                          style: TextStyle(color: Color(0xFFFEDF89)),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
