import 'package:bookstore/src/constants/image_strings.dart';
import 'package:bookstore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class FavoriteScreenFill1 extends StatefulWidget {
  const FavoriteScreenFill1({Key? key}) : super(key: key);

  @override
  _FavoriteScreenFill1State createState() => _FavoriteScreenFill1State();
}

class _FavoriteScreenFill1State extends State<FavoriteScreenFill1> {
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu_outlined,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Favorit Fill",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Toggle the view mode
                      setState(() {
                        _isGridView = !_isGridView;
                      });
                    },
                    icon: Icon(
                      _isGridView
                          ? Icons.list_outlined
                          : Icons.grid_view_outlined,
                      color: Colors.black,
                    ),
                    tooltip: 'Lihat Sebagai',
                  ),
                ],
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              favoriteSearch(context),
              const SizedBox(height: 24),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: _isGridView ? _buildGridView() : _buildListView(),
              ),
            ],
          ),
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
        crossAxisSpacing: 100,
        mainAxisSpacing: 30,
        childAspectRatio: 152 / 270,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 270,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(tBookImagePlaceholder),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
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

Widget favoriteSearch(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      color: Colors.grey[200],
    ),
    child: TextField(
      // controller: searchController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Searching",
        hintStyle: TextStyle(color: Colors.grey[500]),
        prefixIcon: IconButton(
          hoverColor: Colors.transparent,
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
