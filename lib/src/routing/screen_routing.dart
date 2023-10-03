// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../features/beranda/view/beranda.dart';
import '../features/book_read/book_read_screen.dart';
import '../features/favorite/view/favorite_screen.dart';
import '../features/profile/view/profile_screen.dart';
import '../utils/screen_theme/reusable_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndexVar = 0;

  final screens = [
    const Beranda(),
    FavoriteScreen(),
    const ReadScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // gunakan IndexedStack untuk preserve kondisi screen ketika dialihkan
      body: IndexedStack(
        index: currentIndexVar,
        children: screens,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorShape: CircleBorder(),
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: NavigationBar(
            // animationDuration: Duration(seconds: 1),
            height: 70,
            backgroundColor: ThemeUtils.getNavbarBackgroundColor(context),
            elevation: 4,
            selectedIndex: currentIndexVar,
            onDestinationSelected: (index) =>
                setState(() => currentIndexVar = index),
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                // Increase the size here
                label: "Beranda",
                selectedIcon: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ), // Increase the size here
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.favorite_outline,
                  size: 30,
                ),
                // Increase the size here
                label: "Favorit",
                selectedIcon: Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.white,
                ), // Increase the size here
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.chrome_reader_mode_outlined,
                  size: 30,
                ),
                // Increase the size here
                label: "Bacaan",
                selectedIcon: Icon(
                  Icons.chrome_reader_mode,
                  size: 30,
                  color: Colors.white,
                ), // Increase the size here
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_outline_rounded,
                  size: 30,
                ),
                // Increase the size here
                label: "Profil",
                selectedIcon: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ), // Increase the size here
              ),
            ],
          ),
        ),
      ),
    );
  }
}
