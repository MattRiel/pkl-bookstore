import 'package:bookstore/src/features/beranda/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../book_detail/detailBuku.dart';

class BukuGridView extends StatelessWidget {
  final List<Book> books;

  const BukuGridView({required this.books, super.key});

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
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = _calculateCrossAxisCount(screenWidth);
    return SingleChildScrollView(
      child: SizedBox(
        height: 580,
        child: GridView.builder(
          itemCount: books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
              childAspectRatio: 140 / 250,
              crossAxisCount: crossAxisCount),
          itemBuilder: (context, index) {
            final itemBookGrid = books[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => DetailBuku(book: itemBookGrid));
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(itemBookGrid.imageUrl),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            itemBookGrid.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            itemBookGrid.author,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF7A7A7A),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 2,
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
