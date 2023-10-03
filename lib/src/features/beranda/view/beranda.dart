// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/features/beranda/model/book_model.dart';
import 'package:bookstore/src/reusable_widgets/all_searchbar.dart';
import 'package:bookstore/src/reusable_widgets/all_topbar.dart';
import 'package:bookstore/src/utils/const_widget/device_sizes.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';

import '../../../utils/screen_theme/reusable_theme.dart';
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
      backgroundColor: ThemeUtils.getBackgroundColor(context),
      appBar: AppBar(
        actions: [allTopBar(context, 'Beranda')],
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
                width: deviceScreenWidth(context),
                child: Column(
                  children: [
                    tHeightSpace(40),
                    categorySection(context),
                    tHeightSpace(40),
                    FutureBuilder<void>(
                      future: _controller.loadData(),
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            bookSection(
                              context,
                              _controller,
                              _controller.model.latestBooks.cast<Book>(),
                              tBukuTerbaruTitle,
                            ),
                            authorSection(context, _controller),
                            bookSection(
                              context,
                              _controller,
                              _controller.model.generalBooks.cast<Book>(),
                              tBukuAjarTitle,
                            ),
                            bookSection(
                              context,
                              _controller,
                              _controller.model.journals.cast<Book>(),
                              tJournalTitle,
                            ),
                            bookSection(
                              context,
                              _controller,
                              _controller.model.proceedings.cast<Book>(),
                              tProceedingTitle,
                            ),
                          ],
                        );
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
