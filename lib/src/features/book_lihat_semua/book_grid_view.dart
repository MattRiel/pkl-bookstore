import 'package:bookstore/src/features/beranda/model/book_model.dart';
import 'package:bookstore/src/utils/const_widget/device_sizes.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../book_detail/detail_buku.dart';

class BukuGridView extends StatelessWidget {
  final List<Book> multipleBooks;

  const BukuGridView({required this.multipleBooks, super.key});

  int _calculateCrossAxisCount(double width) {
    if (width >= 1200) {
      return 4;
    } else if (width >= 800) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = deviceScreenWidth(context);
    int crossAxisCount = _calculateCrossAxisCount(screenWidth);
    return SingleChildScrollView(
      child: SizedBox(
        height: 580,
        child: GridView.builder(
          itemCount: multipleBooks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
              childAspectRatio: 140 / 250,
              crossAxisCount: crossAxisCount),
          itemBuilder: (context, index) {
            final singleBook = multipleBooks[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => DetailBuku(book: singleBook));
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(singleBook.imageUrl),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    tHeightSpace(8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            singleBook.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            singleBook.author,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
