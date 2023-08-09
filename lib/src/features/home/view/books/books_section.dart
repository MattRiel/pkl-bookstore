import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:bookstore/src/features/home/view/books/allbook_widget.dart';
import 'package:flutter/material.dart';

import 'books_scroll.dart';

Widget bookSection(BuildContext context, BerandaController controller,
    List<Map<String, dynamic>> data, String title) {
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
