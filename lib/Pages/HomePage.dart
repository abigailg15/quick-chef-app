import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Search.dart';
import 'Pantry.dart';
import 'Favorites.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _homePage();
}

class _homePage extends State<HomePage> {
  final List<Widget> _pages = [
    Search(),
    Pantry(),
    Favorites(),
  ];
  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    void _navigateBottomBar(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: "Pantry"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
