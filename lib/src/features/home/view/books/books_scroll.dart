import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../book_detail/detailBuku.dart';

Widget booksHorizontalScroll(BuildContext context,
    List<Map<String, dynamic>> books, BerandaController controller) {
  var latestBook = controller.model.latestBooks;
  return latestBook.isEmpty
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : SizedBox(
          height: 238,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: latestBook.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => const DetailBuku());
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
                                  image: NetworkImage(book['imageUrl']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              height: 206,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            book['title'],
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
