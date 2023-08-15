import 'package:bookstore/src/features/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../beranda/model/book_model.dart';

class detailTopBar extends StatefulWidget {
  final Book book;

  detailTopBar({
    super.key,
    required this.book,
  });

  @override
  State<detailTopBar> createState() => _detailTopBarState();
}

class _detailTopBarState extends State<detailTopBar> {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteController.isFavorite(widget.book);
    return Container(
      color: Color(0xFFF04437),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                if (isFavorite) {
                  favoriteController.removeFromFavorites(widget.book);
                } else {
                  favoriteController.addToFavorites(widget.book);
                }
                setState(() {
                  isFavorite != isFavorite;
                });
              },
              icon: isFavorite
                  ? Icon(Icons.bookmark)
                  : Icon(Icons.bookmark_outline),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
