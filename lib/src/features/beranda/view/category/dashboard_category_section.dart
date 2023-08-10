import 'package:bookstore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'dashboard_category_buttons.dart';

Widget dashboardCategory(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 24.0),
    child: SizedBox(
      height: 128,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            tKategoriTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          // kategori row 1
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                categoryButton(tKategori1, () {}),
                const SizedBox(width: 12),
                categoryButton(tKategori2, () {}),
                const SizedBox(width: 12),
                categoryButton(tKategori3, () {}),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // kategori row 2
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                categoryButton(tKategori4, () {}),
                const SizedBox(
                  width: 12,
                ),
                categoryButton(tKategori5, () {}),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
