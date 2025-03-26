import 'package:clothingstore/features/presentation/pages/Orders_Page/orders_page.dart';
import 'package:clothingstore/features/presentation/pages/home/home.dart';
import 'package:clothingstore/features/presentation/pages/home/wishlist/wishlits_page.dart';
import 'package:clothingstore/features/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  // Define the pages that correspond to each tab
  final List<Widget> _pages = [
    Home(),
    WishlitsPage(),
    OrdersPage(),
    ProfilePage(),
  ];

  // Update the selected index on tap
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed, // Fixes the icons for all tabs
        items: [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.box), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: ''),
        ],
      ),
    );
  }
}
