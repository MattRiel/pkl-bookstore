import 'package:bookstore/src/constants/colors.dart';
import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';

class AllSearchBar extends StatelessWidget {
  const AllSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          tHeightSpace(10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: tSearchBarBg,
            ),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: tSearch,
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: IconButton(
                  splashRadius: 10,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_sharp,
                    color: tDarkColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
