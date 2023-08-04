// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bookstore/backend/penulis_service.dart';
import 'package:bookstore/backend/buku_service.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  // Kategori
  bool terbaruShow = true;
  bool penulisShow = true;
  bool ajarShow = true;
  bool journalShow = true;
  bool proceedingShow = true;

  // Fetch API
  List<Map<String, dynamic>> userDataList = [];
  List<Map<String, dynamic>> booksList = [];

  void loadData() async {
    List<Map<String, dynamic>> userData = await fetchUserData();
    List<Map<String, dynamic>> bookData = await fetchBooks();
    setState(() {
      userDataList = userData;
      booksList = bookData;
    });
  }

  // Bottom NavBar

  @override
  void initState() {
    super.initState();
    loadData();
  }

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
          child: SizedBox(
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
    );
  }

  Widget buildTopBarSection(BuildContext context) {
    // final profileImage = userDataList[userDataList.length - 1];
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
              onPressed: () {},
              child: Text(
                "Beranda",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            userDataList.isEmpty
                ? CircularProgressIndicator()
                : CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      userDataList[userDataList.length - 1]['picture']
                          ['thumbnail'],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildKategoriSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: SizedBox(
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
            SizedBox(
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
            SizedBox(
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
              onPressed: () {},
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
            lihatSemuaButton(context),
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
            lihatSemuaButton(context),
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
        // Foto Penulis
        userDataList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: 138,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userDataList.length,
                  itemBuilder: (context, index) {
                    final userData = userDataList[index];
                    return Row(
                      children: [
                        SizedBox(
                          height: 102,
                          width: 77,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 76,
                                width: 76,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    userData['picture']['thumbnail'],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                '${userData['name']['first']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xFF282828)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
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
            lihatSemuaButton(context),
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
            lihatSemuaButton(context),
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
    return booksList.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: 238,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: booksList.length,
              itemBuilder: (context, index) {
                final book = booksList[index];
                return Row(
                  children: [
                    SizedBox(
                      height: 238,
                      width: 152,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(book['imageUrl']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              height: 206,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            book['title'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
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

  Widget lihatSemuaButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Text(
        "Lihat semua",
        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
      ),
    );
  }
}
