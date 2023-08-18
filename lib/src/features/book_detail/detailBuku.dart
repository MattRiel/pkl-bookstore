// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/features/book_detail/detailTopBar.dart';
import 'package:bookstore/src/features/book_detail/detail_text_style.dart';
import 'package:flutter/material.dart';

import '../beranda/model/book_model.dart';

class DetailBuku extends StatelessWidget {
  final Book book;

  DetailBuku({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF04437),
      appBar: AppBar(
        backgroundColor: Color(0xFFF04437),
        elevation: 0,
        actions: [
          detailTopBar(
            book: book,
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 370,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.yellow,
                      ),
                      height: 206,
                      width: 152,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          image: NetworkImage(book.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: Column(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown, // Adjust the text to fit
                              child: Text(
                                book.title,
                                style: DetailTextStyle.headline1,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown, // Adjust the text to fit
                              child: Text(
                                book.author,
                                style: DetailTextStyle.subheadline1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              tBookLang,
                              style: DetailTextStyle.title1,
                            ),
                            Text(
                              book.language,
                              style: DetailTextStyle.subtitle1,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              tBookPage,
                              style: DetailTextStyle.title1,
                            ),
                            Text(
                              '${book.numberOfPages} $tBookPage',
                              style: DetailTextStyle.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tBookAboutTitle,
                      style: DetailTextStyle.aboutStyle,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      book.description,
                      style: DetailTextStyle.contentStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF344054),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          tBookReadButton,
                          style: DetailTextStyle.title1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
