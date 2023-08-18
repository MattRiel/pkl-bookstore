import 'package:flutter/material.dart';

AppBar buildAppBar(
  BuildContext context,
  String title,
  bool isGridView,
  Function() toggleView,
) {
  return AppBar(
    elevation: 0,
    actions: [
      Container(
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
                splashRadius: 25,
                splashColor: Colors.green[500],
                onPressed: toggleView,
                icon: Icon(
                  isGridView
                      ? Icons.format_list_bulleted_outlined
                      : Icons.grid_view_outlined,
                  color: Colors.black,
                ),
                tooltip: isGridView ? 'List View' : 'Grid View',
              ),
            ],
          ),
        ),
      )
    ],
    backgroundColor: Colors.white,
  );
}
