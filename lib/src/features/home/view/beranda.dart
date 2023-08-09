// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:bookstore/src/features/home/view/books/books_section.dart';
import 'package:bookstore/src/features/home/view/topbar/topbar_widget.dart';
import 'package:flutter/material.dart';

import 'author/dashboardPenulis.dart';
import 'category/dashboard_category_section.dart';
import 'search/search_widget.dart';

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
        actions: [TopBarWidget()],
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
                dashboardSearch(context),
                SizedBox(height: 40),
                dashboardCategory(context),
                SizedBox(height: 40),
                FutureBuilder<void>(
                  future: _controller.loadData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        children: [
                          bookSection(context, _controller,
                              _controller.model.latestBooks, 'Buku Terbaru'),
                          penulisWidget(context, _controller),
                          SizedBox(height: 40),
                          bookSection(context, _controller,
                              _controller.model.generalBooks, 'Buku Ajar'),
                          bookSection(context, _controller,
                              _controller.model.journals, 'Journals'),
                          bookSection(context, _controller,
                              _controller.model.proceedings, 'Proceeding'),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
