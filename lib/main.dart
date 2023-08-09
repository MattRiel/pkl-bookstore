// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookstore/backend/config.dart';
import 'package:bookstore/content/detailBuku.dart';
import 'package:bookstore/content/favoriteScreen.dart';
import 'package:bookstore/content/profileScreen.dart';
import 'package:bookstore/content/readScreen.dart';
import 'package:bookstore/frontpages/login.dart';
import 'package:bookstore/src/utils/theme/theme.dart';
import 'package:bookstore/unused/bookdetails.dart';
import 'package:bookstore/unused/homescreen.dart';
import 'package:bookstore/unused/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'content/beranda.dart';
import 'frontpages/spscreen1.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  final BookService bookService = BookService(googleBooksApiKey);

  runApp(MaterialApp(
    theme: TAppTheme.lightTheme,
    darkTheme: TAppTheme.darkTheme,
    themeMode: ThemeMode.system,
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
    ReadScreen(),
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: Color(0xFF1D5755),
            backgroundColor: Colors.green[500],
            elevation: 4,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndexVar,
            onTap: (index) {
              setState(() {
                currentIndexVar = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Beranda",
              ),
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
