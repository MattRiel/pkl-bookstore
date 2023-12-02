import 'package:bookstore/src/features/beranda/model/book_model.dart';
import 'package:bookstore/src/reusable_widgets/all_searchbar.dart';
import 'package:flutter/material.dart';

import '../../reusable_widgets/all_grid_list_appbar.dart';
import '../../utils/screen_theme/reusable_theme.dart';
import 'book_grid_view.dart';
import 'book_list_view.dart';

class BukuLihatSemua extends StatefulWidget {
  final List<Book> books;
  final String titleSection;

  const BukuLihatSemua(
      {Key? key, required this.books, required this.titleSection})
      : super(key: key);

  @override
  BukuLihatSemuaState createState() => BukuLihatSemuaState();
}

class BukuLihatSemuaState extends State<BukuLihatSemua> {
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
      backgroundColor: ThemeUtils.getBackgroundColor(context),
      appBar: customAppBar,
      body: Column(
        children: [
          const AllSearchBar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _isGridView
                  ? BukuGridView(multipleBooks: widget.books)
                  : BukuListView(multipleBooks: widget.books),
            ),
          ),
        ],
      ),
    );
  }
}
