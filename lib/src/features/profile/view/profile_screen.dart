import 'package:bookstore/src/constants/text_strings.dart';
import 'package:bookstore/src/features/profile/view/updateprofile_screen.dart';
import 'package:bookstore/src/features/profile/widgets/profile_top_bar.dart';
import 'package:bookstore/src/repository/authentication_repository/authentication_repository.dart';
import 'package:bookstore/src/utils/const_widget/sized_boxed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_theme/reusable_theme.dart';
import '../widgets/profile_btn_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: ThemeUtils.getBackgroundColor(context),
      appBar: AppBar(
        elevation: 0,
        actions: const [ProfileTopbar()],
        backgroundColor: ThemeUtils.getNavbarBackgroundColor(context),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          tHeightSpace(60),
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.transparent : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 47,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                isDark ? Colors.grey : Colors.transparent,
                            child: Icon(Icons.person),
                          ),
                          tWidthSpace(24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(tProfileName,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(tProfileEmail,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Get.to(() => UpdateProfileScreen());
                        },
                      ),
                    ],
                  ),
                ),
                tHeightSpace(24),
                ProfileBtn(
                  text: "Notifikasi",
                  icon: Icons.toggle_on_rounded,
                  onPressed: () {},
                ),
                tHeightSpace(24),
                ProfileBtn(
                  text: isDark ? "Mode gelap" : "Mode terang",
                  icon: isDark
                      ? Icons.dark_mode_outlined
                      : Icons.wb_sunny_outlined,
                  onPressed: () {},
                ),
                tHeightSpace(24),
                ProfileBtn(
                  text: 'Pengaturan',
                  icon: Icons.settings,
                  onPressed: () {},
                ),
                tHeightSpace(24),
                ProfileBtn(
                  text: "Keluar",
                  icon: Icons.exit_to_app,
                  onPressed: () {
                    AuthenticationRepository.instance.logout();
                  },
                ),
                tHeightSpace(24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
