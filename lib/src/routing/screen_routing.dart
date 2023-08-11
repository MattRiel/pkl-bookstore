import 'package:flutter/material.dart';

import '../features/beranda/view/beranda.dart';
import '../features/book_read/readScreen.dart';
import '../features/favorite/favoriteScreen.dart';
import '../features/profile/view/profileScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndexVar = 0;

  final screens = [
    const Beranda(),
    const FavoriteScreen(),
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
        data: const NavigationBarThemeData(
            indicatorColor: Colors.white,
            labelTextStyle: MaterialStatePropertyAll(
              TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: NavigationBar(
            // animationDuration: Duration(seconds: 1),
            height: 70,
            backgroundColor: Colors.green[500],
            elevation: 4,
            selectedIndex: currentIndexVar,
            onDestinationSelected: (index) =>
                setState(() => this.currentIndexVar = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: "Beranda",
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: "Favorit",
                selectedIcon: Icon(Icons.favorite),
              ),
              NavigationDestination(
                icon: Icon(Icons.chrome_reader_mode_outlined),
                label: "Bacaan",
                selectedIcon: Icon(Icons.chrome_reader_mode),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded),
                label: "Profil",
                selectedIcon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
