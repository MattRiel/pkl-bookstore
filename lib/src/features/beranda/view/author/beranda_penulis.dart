import 'package:flutter/material.dart';

import '../../../../constants/text_strings.dart';
import '../../../../utils/const_widget/sized_boxed.dart';
import '../../controller/beranda_controller.dart';

Widget authorSection(BuildContext context, BerandaController controller) {
  var multipleUsers = controller.model.userDataList;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tPenulisDicariTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      tHeightSpace(12),
      SizedBox(
        height: 138,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: multipleUsers.length,
          itemBuilder: (context, index) {
            final singleUser = multipleUsers[index];
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
                            singleUser['picture']['thumbnail'],
                          ),
                        ),
                      ),
                      tHeightSpace(6),
                      FittedBox(
                        clipBehavior: Clip.none,
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '${singleUser['name']['first']}',
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                tWidthSpace(20),
              ],
            );
          },
        ),
      ),
    ],
  );
}
