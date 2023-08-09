// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:flutter/material.dart';

import 'author/author_widget.dart';
import 'books/buku_ajar_widget.dart';
import 'books/buku_terbaru_widget.dart';
import 'books/journal_widget.dart';
import 'books/proceeding_widget.dart';
import 'category/dashboard_category_section.dart';
import 'search/search_widget.dart';
import 'topbar/topbar_widget.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final BerandaController _controller = BerandaController();

  @override
  void initState() {
    super.initState();
    _controller.loadData();
    _controller.printDataStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [topBarWidget(context)],
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
                dashboardTerbaru(context, _controller),
                SizedBox(height: 40),
                dashboardPenulis(context),
                SizedBox(height: 40),
                dashboardBukuAjar(context, _controller),
                dashboardBukuAjar(context, _controller),
                dashboardBukuAjar(context, _controller),
                // area journal
                dashboardJournal(context, _controller),
                SizedBox(height: 40),
                dashboardProceeding(context, _controller),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
