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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: const Color(0xFF1D5755),
            backgroundColor: Colors.green[500],
            elevation: 4,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndexVar,
            onTap: (index) {
              setState(() {
                currentIndexVar = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Beranda",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorit"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chrome_reader_mode_outlined),
                  label: "Bacaan"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profil"),
            ]),
      ),
    );
  }
}
