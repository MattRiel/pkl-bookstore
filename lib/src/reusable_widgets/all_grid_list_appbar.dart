import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
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
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tWidthSpace(20),
              TextButton(
                onPressed: () {},
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              IconButton(
                splashRadius: 25,
                splashColor: Colors.black,
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
    backgroundColor: Colors.green[500],
  );
}
