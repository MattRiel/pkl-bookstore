import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/text_strings.dart';
import '../../../book_lihat_semua/book_lihat_semua_screen.dart';
import '../../model/book_model.dart';

Widget lihatSemuaButton(BuildContext context, List<Book> books, String title) {
  return Padding(
    padding: const EdgeInsets.only(right: 24),
    child: TextButton(
      onPressed: () {
        Get.to(
          () => BukuLihatSemua(
            books: books,
            titleSection: title,
          ),
        );
      },
      child: Text(
        tLihatSemuaTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ),
  );
}
