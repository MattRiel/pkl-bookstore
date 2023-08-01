import 'package:bookstore/bookdetails.dart';
import 'package:bookstore/favoriteScreen.dart';
import 'package:bookstore/frontpages/login.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/backend/services.dart';
import 'package:bookstore/homescreen.dart';
import 'package:bookstore/backend/config.dart';
import 'beranda.dart';
import 'frontpages/spscreen1.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  final BookService bookService = BookService(googleBooksApiKey);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/favorite',
    routes: {
      '/beranda': (context) => Beranda(),
      '/home': (context) => HomeScreen(bookService: bookService),
      '/details': (context) => BookDetailScreen(),
      '/spscreen1': (context) => SplashScreen1(),
      '/login': (context) => Login(),
      '/favorite': (context) => FavoriteScreen()
    },
  ));
}
