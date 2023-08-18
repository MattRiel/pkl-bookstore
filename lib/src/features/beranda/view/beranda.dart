// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookstore/src/features/beranda/model/book_model.dart';
import 'package:bookstore/src/reusable_widgets/all_searchbar.dart';
import 'package:bookstore/src/reusable_widgets/all_topbar.dart';
import 'package:flutter/material.dart';

import '../controller/beranda_controller.dart';
import 'author/beranda_penulis.dart';
import 'books/books_section.dart';
import 'category/dashboard_category_section.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final BerandaController _controller = BerandaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [allTopBar(context, 'Beranda')],
        backgroundColor: Colors.white,
      ),
      // main
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AllSearchBar(),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    dashboardCategory(context),
                    SizedBox(height: 40),
                    FutureBuilder<void>(
                      future: _controller.loadData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Column(
                            children: [
                              bookSection(
                                  context,
                                  _controller,
                                  _controller.model.latestBooks.cast<Book>(),
                                  'Buku Terbaru'),
                              penulisWidget(context, _controller),
                              SizedBox(height: 20),
                              bookSection(
                                  context,
                                  _controller,
                                  _controller.model.generalBooks.cast<Book>(),
                                  'Buku Ajar'),
                              bookSection(
                                  context,
                                  _controller,
                                  _controller.model.journals.cast<Book>(),
                                  'Journals'),
                              bookSection(
                                  context,
                                  _controller,
                                  _controller.model.proceedings.cast<Book>(),
                                  'Proceeding'),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
