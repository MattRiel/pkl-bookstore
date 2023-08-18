import 'package:bookstore/src/constants/image_strings.dart';
import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/reusable_widgets/allSearchBar.dart';
import 'package:flutter/material.dart';

import '../../reusable_widgets/allGirdListAppBar.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
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
    AppBar _appBar = buildAppBar(
      context,
      "Bacaan",
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
      backgroundColor: Colors.white,
      appBar: _appBar,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const AllSearchBar(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: _isGridView
                    ? _buildGridView(crossAxisCount)
                    : _buildListView(),
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

  Widget _buildGridView(int crossAxisCount) {
    return SingleChildScrollView(
      child: Container(
        height: 580,
        child: GridView.builder(
          itemCount: 7,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
              childAspectRatio: 140 / 250,
              crossAxisCount: crossAxisCount),
          itemBuilder: (context, index) {
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
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(tBookImagePlaceholder),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$tBookName $index',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '$tBookAuthor $index',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF7A7A7A),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              value: index.toDouble() * 0.2,
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(width: 13),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$tBookName $index',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        '$tBookAuthor $index',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF7A7A7A),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 160,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          value: index.toDouble() * 0.2,
                          valueColor: const AlwaysStoppedAnimation(Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Icon(Icons.file_download_outlined),
              const SizedBox(
                width: 12,
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
      ),
    );
  }
}
