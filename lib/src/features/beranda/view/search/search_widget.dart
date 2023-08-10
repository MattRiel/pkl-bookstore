import 'package:flutter/material.dart';

Widget dashboardSearch(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 24),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Colors.grey[200]),
      child: TextField(
        // controller: searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Searching",
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
