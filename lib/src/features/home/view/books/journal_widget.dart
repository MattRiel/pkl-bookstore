import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:bookstore/src/features/home/view/books/allbook_widget.dart';
import 'package:flutter/material.dart';

import 'books_scroll.dart';

Widget dashboardJournal(BuildContext context, BerandaController controller) {
  var journals = controller.model.journals;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Journal",
            style: TextStyle(
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
      booksHorizontalScroll(context, journals, controller),
    ],
  );
}
