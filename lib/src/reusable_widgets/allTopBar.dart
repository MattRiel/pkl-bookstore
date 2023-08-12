import 'package:flutter/material.dart';

Widget allTopBar(BuildContext context, String title) {
  return Container(
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
            child: Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.people),
            color: Colors.black,
          )
        ],
      ),
    ),
  );
}
