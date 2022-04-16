import 'package:flutter/material.dart';
import 'package:pgnalyze/app/custom_icons.dart';
import 'package:pgnalyze/app/screens/history_screen.dart';
import 'package:pgnalyze/app/widgets/nav_drawer.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HistoryScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  int _currentIndex = 0;
  final Map<String, IconData> _icons = const {
    'History': Icons.view_list,
    'Board': CustomIcons.chessBoard,
    'Favorite': Icons.favorite,
    'Search': Icons.search,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PGNalyzer"),
      ),
      drawer: const NavDrawer(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        items: _icons
            .map(
              (title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  label: title,
                  icon: Icon(
                    icon,
                    size: 30,
                  ),
                ),
              ),
            )
            .values
            .toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
