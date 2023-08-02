// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          // top bar
          buildTopBarSection(context)
        ],
        backgroundColor: Colors.white,
      ),
      // main
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                // search box
                buildSearchSection(context),
                SizedBox(
                  height: 40,
                ),
                // area kategori
                buildKategoriSection(context),
                SizedBox(
                  height: 40,
                ),
                // area buku terbaru
                buildBukuTerbaruSection(context),
                SizedBox(
                  height: 40,
                ),
                // area penulis paling dicari
                buildPenulisDicariSection(context),
                SizedBox(
                  height: 40,
                ),
                // area buku ajar
                buildBukuAjarSection(context),
                buildBukuAjarSection(context),
                buildBukuAjarSection(context),
                // area journal
                buildJournalSection(context),
                SizedBox(
                  height: 40,
                ), // area proceeding
                buildProceedingSection(context),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
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

  Widget buildTopBarSection(BuildContext context) {
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
                  "Beranda",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildKategoriSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Container(
        height: 128,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kategori",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12),
            // kategori row 1
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildKategoriButton('Buku Ajar', () {}),
                  SizedBox(width: 12),
                  buildKategoriButton('Proceeding', () {}),
                  SizedBox(width: 12),
                  buildKategoriButton('Journal', () {}),
                ],
              ),
            ),
            SizedBox(height: 12),
            // kategori row 2
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildKategoriButton('Buku Panduan', () {}),
                  SizedBox(
                    width: 12,
                  ),
                  buildKategoriButton('Buku Pedoman', () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKategoriButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: Color(0xFFF0F0F0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF282828),
          ),
        ),
      ),
    );
  }

  Widget buildSearchSection(BuildContext context) {
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

  Widget buildBukuTerbaruSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Buku Terbaru",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            LihatSemuaButton(context),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        // buku terbaru
        booksHorizontalScroll(context),
      ],
    );
  }

  Widget buildBukuAjarSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Buku Ajar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            LihatSemuaButton(context),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        booksHorizontalScroll(context),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  Widget buildPenulisDicariSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Penulis Paling Dicari",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 138,
          color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 102,
                    width: 77,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 76,
                          width: 76,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Penulis + $index",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildJournalSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Journal",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            LihatSemuaButton(context),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        booksHorizontalScroll(context),
      ],
    );
  }

  Widget buildProceedingSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Proceeding",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            LihatSemuaButton(context),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        booksHorizontalScroll(context),
      ],
    );
  }

  Widget booksHorizontalScroll(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 238,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                color: Colors.yellow[400],
                height: 238,
                width: 152,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage('figma/book_icon.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 206,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Buku + $index",
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          );
        },
      ),
    );
  }

  Widget LihatSemuaButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Text(
        "Lihat semua",
        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
      ),
    );
  }
}
