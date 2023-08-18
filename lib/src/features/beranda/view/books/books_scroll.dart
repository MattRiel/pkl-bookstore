import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../book_detail/detail_buku.dart';
import '../../model/book_model.dart';

Widget booksHorizontalScroll(BuildContext context, List<Book> books) {
  int banyakBuku = (books.length ~/ 2);
  return books.isEmpty
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : SizedBox(
          height: 238,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: banyakBuku,
            itemBuilder: (context, index) {
              final book = books[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailBuku(book: book));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 238,
                      width: 152,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(book.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              height: 206,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            book.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              );
            },
          ),
        );
}
