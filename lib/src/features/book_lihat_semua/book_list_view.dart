import 'package:bookstore/src/features/book_detail/detail_buku.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../beranda/model/book_model.dart';

class BukuListView extends StatelessWidget {
  final List<Book> multipleBooks;

  const BukuListView({required this.multipleBooks, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: multipleBooks.length,
      itemBuilder: (context, index) {
        final singleBook = multipleBooks[index];
        return Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => DetailBuku(book: singleBook));
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
                            image: NetworkImage(singleBook.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      tWidthSpace(13),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              singleBook.title,
                              style: Theme.of(context).textTheme.bodyLarge,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            tHeightSpace(10),
                            Text(
                              singleBook.author,
                              style: Theme.of(context).textTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            tHeightSpace(8)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            tHeightSpace(12),
          ],
        );
      },
    );
  }
}
