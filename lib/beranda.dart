// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text("Beranda"),
        // centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              children: [
                // search box
                Container(
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
                SizedBox(
                  height: 25,
                ),
                // area kategori
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kategori",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // second row
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all((Radius.circular(12))),
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Buku Ajar"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all((Radius.circular(12))),
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Proceeding"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all((Radius.circular(12))),
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Journal"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // tombol kategori
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all((Radius.circular(12))),
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Buku Panduan"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all((Radius.circular(12))),
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Buku Pedoman"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                // area buku terbaru
                Column(
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
                        Text(
                          "Lihat semua",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // buku terbaru
                    Container(
                      height: 238,
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 238,
                                width: 152,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.grey),
                                      height: 206,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Buku + $index")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                // area penulis paling dicari
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Penulis Paling Dicari",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 138,
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
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
                                        child: Icon(
                                          Icons.person,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Penulis + $index")
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
                ),
                SizedBox(
                  height: 50,
                ),
                // area buku ajar
                Column(
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
                        Text(
                          "Lihat semua",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // buku terbaru
                    Container(
                      height: 238,
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 238,
                                width: 152,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.grey),
                                      height: 206,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Buku + $index")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                // area buku ajar
                Column(
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
                        Text(
                          "Lihat semua",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // buku terbaru
                    Container(
                      height: 238,
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 238,
                                width: 152,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.grey),
                                      height: 206,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Buku + $index")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                // area buku ajar
                Column(
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
                        Text(
                          "Lihat semua",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // buku terbaru
                    Container(
                      height: 238,
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 238,
                                width: 152,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.grey),
                                      height: 206,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Buku + $index")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ), // area journal
                Column(
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
                        Text(
                          "Lihat semua",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // buku terbaru
                    Container(
                      height: 238,
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 238,
                                width: 152,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.grey),
                                      height: 206,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Buku + $index")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ), // area proceeding
                Column(
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
                        Text(
                          "Lihat semua",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // buku terbaru
                    Container(
                      height: 238,
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 238,
                                width: 152,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.grey),
                                      height: 206,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Buku + $index")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
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
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorit"),
        BottomNavigationBarItem(icon: Icon(Icons.chrome_reader_mode_outlined), label: "Bacaan"),BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ]),
    );
  }
}
