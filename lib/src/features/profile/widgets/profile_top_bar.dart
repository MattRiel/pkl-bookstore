import 'package:flutter/material.dart';

class profileTopBar extends StatelessWidget {
  const profileTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F4F7),
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
              child: const Text(
                "Profil",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const CircleAvatar(
              backgroundColor: Color(0xFFF2F4F7),
              child: Icon(
                Icons.grid_view_outlined,
                color: Colors.black,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}