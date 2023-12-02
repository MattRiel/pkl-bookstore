import 'package:bookstore/src/features/beranda/model/book_model.dart';
import 'package:bookstore/src/features/book_detail/detail_buku.dart';
import 'package:bookstore/src/features/favorite/controller/favorite_controller.dart';
import 'package:bookstore/src/reusable_widgets/all_searchbar.dart';
import 'package:bookstore/src/utils/const_widget/device_sizes.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reusable_widgets/all_grid_list_appbar.dart';
import '../../../utils/screen_theme/reusable_theme.dart';

class FavoriteFillBook extends StatefulWidget {
  const FavoriteFillBook({
    Key? key,
  }) : super(key: key);

  @override
  FavoriteFillBookState createState() => FavoriteFillBookState();
}

class FavoriteFillBookState extends State<FavoriteFillBook> {
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
    final multiBooks = favoriteController.favoriteBooks;
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

    return Scaffold(
      backgroundColor: ThemeUtils.getBackgroundColor(context),
      appBar: customAppBar,
      body: Column(
        children: [
          const AllSearchBar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _isGridView
                  ? _buildGridView(multiBooks)
                  : _buildListView(multiBooks),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(RxList<Book> multiBooks) {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: multiBooks.length,
        separatorBuilder: (ctx, i) => tHeightSpace(12),
        itemBuilder: (context, index) {
          final singleFavorite = multiBooks[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                Get.to(() => DetailBuku(book: singleFavorite));
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
                          image: NetworkImage(singleFavorite.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    tWidthSpace(13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            singleFavorite.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            singleFavorite.author,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          tHeightSpace(8),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        favoriteController.removeFromFavorites(singleFavorite);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridView(RxList<Book> multiBooks) {
    double screenWidth = deviceScreenWidth(context);
    int crossAxisCount = _calculateCrossAxisCount(screenWidth);
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        itemCount: multiBooks.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
          childAspectRatio: 140 / 250,
        ),
        itemBuilder: (context, index) {
          final singleBook = multiBooks[index];
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
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(singleBook.imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  tHeightSpace(8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
