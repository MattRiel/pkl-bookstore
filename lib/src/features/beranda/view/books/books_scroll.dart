import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const_widget/device_sizes.dart';
import '../../../../utils/const_widget/sized_boxed.dart';
import '../../../book_detail/detail_buku.dart';
import '../../model/book_model.dart';

Widget booksHorizontalScroll(BuildContext context, List<Book> multipleBooks) {
  int banyakBuku = (multipleBooks.length ~/ 2);
  return multipleBooks.isEmpty
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : SizedBox(
          height: 238,
          width: deviceScreenWidth(context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: banyakBuku,
            itemBuilder: (context, index) {
              final singleBook = multipleBooks[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailBuku(book: singleBook));
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
                                  image: NetworkImage(singleBook.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 206,
                            ),
                          ),
                          tHeightSpace(8),
                          Text(
                            singleBook.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    tWidthSpace(20),
                  ],
                ),
              );
            },
          ),
        );
}
