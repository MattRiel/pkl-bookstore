import 'package:bookstore/content/detailBuku.dart';
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
    initialRoute: '/detail_buku',
    routes: {
      '/beranda': (context) => Beranda(),
      '/home': (context) => HomeScreen(bookService: bookService),
      '/details': (context) => BookDetailScreen(),
      '/spscreen1': (context) => SplashScreen1(),
      '/login': (context) => Login(),
      '/favorite': (context) => FavoriteScreen(),
      '/profile': (context) => ProfileScreen(),
      '/detail_buku': (context) => DetailBuku(),
    },
  ));
}
