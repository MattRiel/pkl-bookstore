import 'package:bookstore/src/features/profile/view/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/text_strings.dart';
import '../../controller/beranda_controller.dart';

Widget topBarWidget(BuildContext context, BerandaController controller) {
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
            onPressed: () {
              controller.loadData();
            },
            child: const Text(
              tBerandaTitle,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => ProfileScreen());
            },
            icon: Icon(Icons.people),
            color: Colors.black,
          )
        ],
      ),
    ),
  );
}
