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
            "Kategori",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          // kategori row 1
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                categoryButton('Buku Ajar', () {}),
                const SizedBox(width: 12),
                categoryButton('Proceeding', () {}),
                const SizedBox(width: 12),
                categoryButton('Journal', () {}),
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
                categoryButton('Buku Panduan', () {}),
                const SizedBox(
                  width: 12,
                ),
                categoryButton('Buku Pedoman', () {}),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
