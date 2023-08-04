// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookstore/content/detailBuku.dart';
import 'package:bookstore/content/readScreen.dart';
import 'package:bookstore/unused/bookdetails.dart';
import 'package:bookstore/content/favoriteScreen.dart';
import 'package:bookstore/frontpages/login.dart';
import 'package:bookstore/content/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/backend/services.dart';
import 'package:bookstore/unused/homescreen.dart';
import 'package:bookstore/backend/config.dart';
import 'content/beranda.dart';
import 'frontpages/spscreen1.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  final BookService bookService = BookService(googleBooksApiKey);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/start',
    routes: {
      '/start': (context) => MainScreen(),
      '/beranda': (context) => Beranda(),
      '/home': (context) => HomeScreen(bookService: bookService),
      '/details': (context) => BookDetailScreen(),
      '/spscreen1': (context) => SplashScreen1(),
      '/login': (context) => Login(),
      '/favorite': (context) => FavoriteScreen(),
      '/profile': (context) => ProfileScreen(),
      '/detail_buku': (context) => DetailBuku(),
      '/read': (context) => ReadScreen(),
    },
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndexVar = 0;

  final screens = [
    Beranda(),
    FavoriteScreen(),
    DetailBuku(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // gunakan IndexedStack untuk preserve kondisi screen ketika dialihkan
      body: IndexedStack(
        index: currentIndexVar,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        clipBehavior: Clip.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BottomNavigationBar(
            backgroundColor: Colors.grey[700],
            elevation: 4,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndexVar,
            onTap: (index) {
              setState(() {
                currentIndexVar = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorit"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chrome_reader_mode_outlined),
                  label: "Bacaan"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profil"),
            ]),
      ),
    );
  }
}
