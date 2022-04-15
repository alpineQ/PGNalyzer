import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                tooltip: 'History',
                icon: const Icon(Icons.view_list),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Sending Message"),
                  ));
                }),
            IconButton(
                tooltip: 'Board',
                icon: SvgPicture.asset(
                  'assets/icons/chessBoard.svg',
                  semanticsLabel: 'Chess board',
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
