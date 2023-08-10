import 'package:flutter/material.dart';

import '../../../book_detail/detailBuku.dart';
import '../../model/book_model.dart';

Widget booksHorizontalScroll(BuildContext context, List<Book> books) {
  // print(books);
  return books.isEmpty
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : SizedBox(
          height: 238,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailBuku(),
                    ),
                  );
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
                                  Radius.circular(20),
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
