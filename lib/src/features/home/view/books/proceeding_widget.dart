import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:flutter/material.dart';

import 'allbook_widget.dart';
import 'books_scroll.dart';

Widget dashboardProceeding(BuildContext context, BerandaController controller) {
  var proceedings = controller.model.proceedings;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Proceeding",
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
      booksHorizontalScroll(context, proceedings, controller),
    ],
  );
}
