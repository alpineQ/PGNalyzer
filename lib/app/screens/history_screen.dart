import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pgnalyze/app/custom_icons.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<ListTile> loadedPGNs = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) => loadedPGNs[index],
        itemCount: loadedPGNs.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['PGN']).then((result) {
            if (result == null) return;
            ListTile newPGN = ListTile(
              leading: const Icon(CustomIcons.chessBoard),
              title: Text(result.files.first.name),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result.files.first.path!))),
            );
            setState(() {
              loadedPGNs.add(newPGN);
            });
          });
        },
        tooltip: 'Load PGN',
        child: const Icon(Icons.add),
      ),
    );
  }
}
