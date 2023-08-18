import 'package:bookstore/src/features/beranda/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../book_lihat_semua/book_lihat_semua_screen.dart';

Widget lihatSemuaWidget(BuildContext context, List<Book> books, String title) {
  return Padding(
    padding: const EdgeInsets.only(right: 24),
    child: TextButton(
      onPressed: () {
        Get.to(() => BukuLihatSemua(
              books: books,
              titleSection: title,
            ));
      },
      child: const Text('Lihat Semua'),
    ),
  );
}
