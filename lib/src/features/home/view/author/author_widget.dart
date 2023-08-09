import 'package:bookstore/src/features/home/controller/beranda_controller.dart';
import 'package:flutter/material.dart';

Widget dashboardPenulis(BuildContext context) {
  BerandaController controller = BerandaController();
  var userDataList = controller.model.userDataList;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Penulis Paling Dicari",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: 12,
      ),
      // Foto Penulis
      userDataList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: 138,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userDataList.length,
                itemBuilder: (context, index) {
                  final userData = userDataList[index];
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
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '${userData['name']['first']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF282828)),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  );
                },
              ),
            ),
    ],
  );
}
