import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/features/profile/widgets/profile_top_bar.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';

import '../../../utils/screen_theme/reusable_theme.dart';
import '../widgets/profile_btn_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUtils.getBackgroundColor(context),
      appBar: AppBar(
        elevation: 0,
        actions: const [ProfileTopbar()],
        backgroundColor: const Color(0xFFF2F4F7),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 47,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            child: SizedBox(
                              height: 47,
                              width: 47,
                              child: Icon(Icons.person),
                            ),
                          ),
                          addHorizontalSpace(24),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tProfileName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                tProfileEmail,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    addVerticalSpace(24),
                    ProfileBtn(
                        text: "Notifikasi",
                        icon: Icons.toggle_on_rounded,
                        onPressed: () {}),
                    const SizedBox(height: 24),
                    ProfileBtn(
                        text: "Bantuan",
                        icon: Icons.arrow_forward_ios_rounded,
                        onPressed: () {}),
                    const SizedBox(height: 24),
                    ProfileBtn(
                        text: "Keluar",
                        icon: Icons.exit_to_app,
                        onPressed: () {}),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
