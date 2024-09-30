import 'package:flutter/material.dart';
import 'package:flutter_interview_quetion/Screens/favorite_screen.dart';
import 'package:flutter_interview_quetion/constant/app_colors.dart';
import 'package:flutter_interview_quetion/widgets/custom_nav_bar_item.dart';

import 'home_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 0;
  List<Widget> screens = [];
  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const FavoriteScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        elevation: 0.0,
        items: items,
      ),
      body: screens[currentIndex],
    );
  }
}
