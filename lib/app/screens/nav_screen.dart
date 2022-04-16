import 'package:flutter/material.dart';
import 'package:pgnalyze/app/custom_icons.dart';
import 'package:pgnalyze/app/screens/board_screen.dart';
import 'package:pgnalyze/app/screens/history_screen.dart';
import 'package:pgnalyze/app/widgets/nav_drawer.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenItem {
  final Widget screen;
  final String title;
  final IconData icon;

  const _NavScreenItem(this.screen, this.title, this.icon);
}

class _NavScreenState extends State<NavScreen> {
  final List<_NavScreenItem> _screens = const [
    _NavScreenItem(HistoryScreen(), 'History', Icons.view_list),
    _NavScreenItem(BoardScreen(), 'Board', CustomIcons.chessBoard),
    _NavScreenItem(Scaffold(), 'Favorite', Icons.favorite),
    _NavScreenItem(Scaffold(), 'Search', Icons.search),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PGNalyzer"),
      ),
      drawer: const NavDrawer(),
      body: _screens[_currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        items: _screens
            .map(
              (navItem) => BottomNavigationBarItem(
                label: navItem.title,
                icon: Icon(
                  navItem.icon,
                  size: 30,
                ),
              ),
            )
            .toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
