import 'package:bookstore/src/features/book_detail/detail_buku.dart';
import 'package:bookstore/src/features/favorite/controller/favorite_controller.dart';
import 'package:bookstore/src/reusable_widgets/all_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reusable_widgets/all_grid_list_appbar.dart';
import '../../../utils/screen_theme/reusable_theme.dart';

class FavoriteFillBook extends StatefulWidget {
  const FavoriteFillBook({
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteFillBookState createState() => _FavoriteFillBookState();
}

class _FavoriteFillBookState extends State<FavoriteFillBook> {
  final FavoriteController favoriteController = Get.find();
  bool _isGridView = false;

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
    AppBar customAppBar = buildAppBar(
      context,
      "Favorit Fill",
      _isGridView,
      () {
        setState(() {
          _isGridView = !_isGridView;
        });
      },
    );
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = _calculateCrossAxisCount(screenWidth);
    return Scaffold(
      backgroundColor: ThemeUtils.getBackgroundColor(context),
      appBar: customAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AllSearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: _isGridView
                        ? _buildGridView(crossAxisCount)
                        : _buildListView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Obx(
      () => ListView.builder(
        itemCount: favoriteController.favoriteBooks.length,
        itemBuilder: (context, index) {
          final favBookList = favoriteController.favoriteBooks[index];
          return Column(
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(() => DetailBuku(book: favBookList));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 52,
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(favBookList.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favBookList.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                favBookList.author,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF7A7A7A),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            favoriteController.removeFromFavorites(favBookList);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGridView(int crossAxisCount) {
    return Obx(
      () => SingleChildScrollView(
        child: SizedBox(
          height: 580,
          child: GridView.builder(
            itemCount: favoriteController.favoriteBooks.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 40,
              childAspectRatio: 130 / 270,
            ),
            itemBuilder: (context, index) {
              final favBookGrid = favoriteController.favoriteBooks[index];
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(() => DetailBuku(book: favBookGrid));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 270,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(favBookGrid.imageUrl),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favBookGrid.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              favBookGrid.author,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFF7A7A7A),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
