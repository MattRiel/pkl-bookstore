// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  int tekanCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 316,
              child: Image.asset('figma/sp1.png')),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey[200]),
            height: 195,
            child: Column(
              children: [
                // Buku Elektronik USU
                SizedBox(
                  height: 72,
                  width: 327,
                  child: Column(
                    children: [
                      Text(
                        "Buku Elektronik USU",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Daftar E-books yang dilanggan dan diperuntukkan bagi",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Sivitas Akademika Universitas Sumatera Utara.",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFf04437),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacementNamed(context, '/login');
                    });
                  },
                  child: Text("Selanjutnya"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
