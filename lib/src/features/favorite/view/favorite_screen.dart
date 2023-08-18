// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookstore/src/features/favorite/view/favorite_empty.dart';
import 'package:bookstore/src/features/favorite/view/favorite_filled.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int favoriteIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: favoriteIndex,
        children: [
          FavoriteNoBook(
            favoriteIndex: favoriteIndex,
            onSeeFavoritePressed: () {
              setState(() {
                favoriteIndex = 1;
              });
            },
          ),
          FavoriteFillBook(),
        ],
      ),
    );
  }
}
