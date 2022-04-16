import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
