import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'home_screen.dart';

import 'my_list_screen.dart';
import 'search_screen.dart';

class MainNavigatorScreen extends StatefulWidget {
  const MainNavigatorScreen({super.key});

  @override
  State<MainNavigatorScreen> createState() =>
      _MainNavigatorScreenState();
}

class _MainNavigatorScreenState
    extends State<MainNavigatorScreen> {
  int _selectedIndex = 0;

  final List<Widget> _buildScreen = [
    const HomeScreen(),
    const SearchScreen(),
    const MyListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      body: _buildScreen.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPallete.mineShaft,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: ColorPallete.grey,
            ),
            label: "Home",
            activeIcon: Icon(
              Icons.home,
              color: ColorPallete.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: ColorPallete.grey,
            ),
            label: "Search",
            activeIcon: Icon(
              Icons.search,
              color: ColorPallete.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.playlist_play,
              color: ColorPallete.grey,
            ),
            label: "My List",
            activeIcon: Icon(
              Icons.playlist_play,
              color: ColorPallete.white,
            ),
          ),
        ],
        selectedItemColor: ColorPallete.white,
        unselectedItemColor: ColorPallete.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
