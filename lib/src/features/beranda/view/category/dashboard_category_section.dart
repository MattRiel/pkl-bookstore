import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';

import 'dashboard_category_buttons.dart';

Widget categorySection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 24.0),
    child: SizedBox(
      height: 128,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tKategoriTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          tHeightSpace(12),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                categoryButton(context, tKategori1, () {}),
                tWidthSpace(12),
                categoryButton(context, tKategori2, () {}),
                tWidthSpace(12),
                categoryButton(context, tKategori3, () {}),
              ],
            ),
          ),
          tHeightSpace(12),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                categoryButton(context, tKategori4, () {}),
                tWidthSpace(12),
                categoryButton(context, tKategori5, () {}),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
