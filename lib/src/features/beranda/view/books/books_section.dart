import 'package:flutter/material.dart';

import '../../controller/beranda_controller.dart';
import '../../model/book_model.dart';
import 'allbook_widget.dart';
import 'books_scroll.dart';

Widget bookSection(BuildContext context, BerandaController controller,
    List<Book> data, String title) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          dashboardLihatSemua(context),
        ],
      ),
      const SizedBox(
        height: 12,
      ),
      booksHorizontalScroll(context, data),
      const SizedBox(height: 40),
    ],
  );
}
