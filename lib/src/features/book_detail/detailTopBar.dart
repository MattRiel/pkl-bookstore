import 'package:flutter/material.dart';

class detailTopBar extends StatelessWidget {
  const detailTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF04437),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
            ),
            Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
