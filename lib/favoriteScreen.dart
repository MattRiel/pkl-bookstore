// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          // top bar
          favoriteTopBar(context)
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            children: [
              favoriteSearch(context),
              SizedBox(
                height: 282,
              ),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 327,
                    width: 334,
                    child: Column(
                      children: [
                        Text(
                          'Simpan daftar buku',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text(
                          'untuk kamu baca',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Untuk menambahkan buku, klik ikon',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF5E5E5E)),
                        ),
                        Text(
                          'whislist yang ada pada detail buku',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF5E5E5E)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF344054),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          onPressed: () {
                            // Add your logic here
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Temukan Buku',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -180,
                    child: Container(
                      height: 215,
                      width: 203,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("figma/newFavIcon.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 4,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorit"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chrome_reader_mode_outlined), label: "Bacaan"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          ]),
    );
  }

  Widget favoriteTopBar(BuildContext context) {
    return Container(
      color: Colors.white,
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
                onPressed: () {
                  print("Beranda pressed");
                },
                child: Text(
                  "Favorit",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            CircleAvatar(
              backgroundColor: Colors.white,
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

  Widget favoriteSearch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.grey[200]),
        child: TextField(
          // controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Searching",
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: IconButton(
              onPressed: () {
                print("Search button pressed");
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
