import 'package:bookstore/src/constants/image_strings.dart';
import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/reusable_widgets/allSearchBar.dart';
import 'package:flutter/material.dart';

import '../../../reusable_widgets/allGirdListAppBar.dart';

class FavoriteScreenFill1 extends StatefulWidget {
  const FavoriteScreenFill1({Key? key}) : super(key: key);

  @override
  _FavoriteScreenFill1State createState() => _FavoriteScreenFill1State();
}

class _FavoriteScreenFill1State extends State<FavoriteScreenFill1> {
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    AppBar _appBar = buildAppBar(
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
      backgroundColor: Colors.white,
      appBar: _appBar,
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
                    child: _isGridView ? _buildGridView() : _buildListView(),
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
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            listCardView(index),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 40,
        childAspectRatio: 130 / 270,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return gridCardView(index);
      },
    );
  }

  Widget gridCardView(int index) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 300),
              content: Text('Buku $index ditekan'),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: const DecorationImage(
                  image: AssetImage(tBookImagePlaceholder),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$tBookName $index',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '$tBookAuthor $index',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF7A7A7A),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listCardView(int index) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 300),
              content: Text('Buku $index ditekan'),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 70,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(tBookImagePlaceholder),
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
                      '$tBookName $index',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$tBookAuthor $index',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF7A7A7A),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
      ),
    );
  }
}
