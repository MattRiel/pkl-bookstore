import 'package:bookstore/src/features/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../beranda/model/book_model.dart';

class DetailTopbar extends StatefulWidget {
  final Book book;

  const DetailTopbar({
    super.key,
    required this.book,
  });

  @override
  State<DetailTopbar> createState() => _DetailTopbarState();
}

class _DetailTopbarState extends State<DetailTopbar> {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteController.isFavorite(widget.book);
    return Container(
      color: const Color(0xFFF04437),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(milliseconds: 2000),
                    content: !isFavorite
                        ? const Text('Berhasil ditambahkan ke Favorit')
                        : const Text('Berhasil dihapus dari Favorit'),
                  ),
                );
              },
              icon: isFavorite
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_outline),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
