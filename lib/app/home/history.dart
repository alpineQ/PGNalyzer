import 'package:flutter/material.dart';
import 'package:pgnalyze/app/widgets/bottom_bar.dart';
import 'package:pgnalyze/app/widgets/nav_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Map'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Album'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Phone'),
            onTap: () {},
          ),
        ],
      ),
      drawer: const NavDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomBar(shape: CircularNotchedRectangle()),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
