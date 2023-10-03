import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_strings.dart';
import '../../utils/const_widget/device_sizes.dart';
import '../../utils/const_widget/sized_boxed.dart';
import '../../utils/screen_theme/reusable_theme.dart';
import '../beranda/model/book_model.dart';
import 'detail_textstyle.dart';
import 'detail_topbar.dart';

class DetailBuku extends StatelessWidget {
  final Book book;

  const DetailBuku({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ThemeUtils.isDarkMode(context) ? tWhatsappBgColor : tPrimaryColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF04437),
        elevation: 0,
        actions: [
          DetailTopbar(
            book: book,
          )
        ],
      ),
      body: SizedBox(
        width: deviceScreenWidth(context),
        child: Column(
          children: [
            Container(
              height: 370,
              width: deviceScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.yellow,
                      ),
                      height: 206,
                      width: 152,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          image: NetworkImage(book.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    tHeightSpace(20),
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: Column(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                book.title,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                book.author,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    tHeightSpace(20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              tBookLang,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              book.language,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              tBookPage,
                              style: DetailTextStyle.title1,
                            ),
                            Text(
                              '${book.numberOfPages} $tBookPage',
                              style: DetailTextStyle.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            tHeightSpace(20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: tWhiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tBookAboutTitle,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    tHeightSpace(11),
                    Text(
                      book.description,
                      style: DetailTextStyle.contentStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      textAlign: TextAlign.justify,
                    ),
                    tHeightSpace(12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF344054),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          tBookReadButton,
                          style: DetailTextStyle.title1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
