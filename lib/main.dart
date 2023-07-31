import 'package:bookstore/bookdetails.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/backend/services.dart';
import 'package:bookstore/homescreen.dart';
import 'package:bookstore/backend/config.dart';

void main() {
  final BookService bookService = BookService(googleBooksApiKey);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(bookService: bookService),
      '/details': (context) => BookDetailScreen(),
    },
  ));
}
