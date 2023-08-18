import 'package:bookstore/src/features/beranda/model/book_model.dart';
import 'package:bookstore/src/reusable_widgets/all_searchbar.dart';
import 'package:flutter/material.dart';

import '../../reusable_widgets/all_grid_list_appbar.dart';
import 'book_grid_view.dart';
import 'book_list_view.dart';

class BukuLihatSemua extends StatefulWidget {
  final List<Book> books;
  final String titleSection;

  const BukuLihatSemua(
      {Key? key, required this.books, required this.titleSection})
      : super(key: key);

  @override
  _BukuLihatSemuaState createState() => _BukuLihatSemuaState();
}

class _BukuLihatSemuaState extends State<BukuLihatSemua> {
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    AppBar customAppBar = buildAppBar(
      context,
      widget.titleSection,
      _isGridView,
      () {
        setState(() {
          _isGridView = !_isGridView;
        });
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const AllSearchBar(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: _isGridView
                    ? BukuGridView(books: widget.books)
                    : BukuListView(books: widget.books),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
