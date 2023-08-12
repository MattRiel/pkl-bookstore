// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookstore/src/constants/image_strings.dart';
import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/features/favorite/concept/favorite_fill1.dart';
import 'package:bookstore/src/reusable_widgets/allSearchBar.dart';
import 'package:bookstore/src/reusable_widgets/allTopBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          // top bar
          allTopBar(context, 'Favorit')
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllSearchBar(),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 282),
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: 327,
                        width: 334,
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                  text: tFavoriteBody1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              tFavoriteBody2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF5E5E5E)),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF344054),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)))),
                              onPressed: () {
                                Get.to(() => FavoriteScreenFill1());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Lihat buku favorit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -180,
                        child: Container(
                          height: 215,
                          width: 203,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(tBookFavPlaceholder),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
