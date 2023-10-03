import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';

import '../../controller/beranda_controller.dart';
import '../../model/book_model.dart';
import 'books_scroll.dart';
import 'lihatsemua_widge.dart';

Widget bookSection(BuildContext context, BerandaController controller,
    List<Book> data, String title) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          lihatSemuaButton(context, data, title),
        ],
      ),
      tHeightSpace(12),
      booksHorizontalScroll(context, data),
      tHeightSpace(40),
    ],
  );
}
