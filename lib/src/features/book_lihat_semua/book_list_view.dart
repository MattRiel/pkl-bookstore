import 'package:bookstore/src/features/book_detail/detail_buku.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../beranda/model/book_model.dart';

class BukuListView extends StatelessWidget {
  final List<Book> books;

  const BukuListView({required this.books, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final itemBookList = books[index];
        return Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => DetailBuku(book: itemBookList));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 52,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(itemBookList.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      addHorizontalSpace(13),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              itemBookList.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            addVerticalSpace(10),
                            Text(
                              itemBookList.author,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFF7A7A7A),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            addVerticalSpace(8)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            addVerticalSpace(12),
          ],
        );
      },
    );
  }
}
