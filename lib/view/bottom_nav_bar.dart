import 'package:coin_news_app/constants/colors.dart';
import 'package:coin_news_app/view/explore_screen.dart';
import 'package:coin_news_app/view/main_screen.dart';
import 'package:coin_news_app/view/tracked_coins_screen.dart';
import 'package:coin_news_app/viewmodel/change_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<ChangeScreens>().selectedIndex;

    late List<Widget> screens = [
      const MainScreen(),
      const ExploreScreen(),
      const TrackedCoinsScreen()
    ];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: screens[selectedIndex]),
      bottomNavigationBar: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          backgroundColor: bottomNavBarColor,
          selectedItemColor: NavBarSelectedColor,
          unselectedItemColor: NavBarUnSelectedColor,
          iconSize: 28,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
                icon:
                    ImageIcon(AssetImage("assets/bottom_bar/home_button.png")),
                label: "Home"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage("assets/bottom_bar/binoculars_button.png")),
                label: "Explore"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage("assets/bottom_bar/tracked_coins_button.png")),
                label: "Tracked Coins"),
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            context.read<ChangeScreens>().changeScreen(value);
          },
        ),
      ),
    );
  }
}
