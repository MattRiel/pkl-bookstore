import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:flutter/material.dart';

Widget penulisWidget(BuildContext context, BerandaController controller) {
  var userDataTotal = controller.model.userDataList;
  const titleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Penulis Paling Dicari",
        style: titleTextStyle,
      ),
      const SizedBox(height: 12),
      SizedBox(
        height: 138,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: userDataTotal.length,
          itemBuilder: (context, index) {
            final userData = userDataTotal[index];
            return Row(
              children: [
                SizedBox(
                  height: 102,
                  width: 77,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 76,
                        width: 76,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            userData['picture']['thumbnail'],
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${userData['name']['first']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF282828)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            );
          },
        ),
      ),
    ],
  );
}
