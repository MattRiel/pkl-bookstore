import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:flutter/material.dart';

import '../../../../constants/text_strings.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BerandaController controller = BerandaController();
    var userData = controller.model.userDataList;
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
            userData.isEmpty
                ? const CircularProgressIndicator()
                : CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      userData[userData.length - 1] as String,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
