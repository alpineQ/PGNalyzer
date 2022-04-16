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
  final List<ListTile> loadedPGNs = [];

  void addPGN() {
    FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['PGN']).then((result) {
      if (result == null) return;
      ListTile newPGN = ListTile(
        leading: const Icon(CustomIcons.chessBoard),
        title: Text(result.files.first.name),
        onTap: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result.files.first.path!))),
      );
      setState(() {
        loadedPGNs.add(newPGN);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadedPGNs.isNotEmpty
          ? ListView.builder(
              key: const PageStorageKey('historyList'),
              itemBuilder: (_, index) => loadedPGNs[index],
              itemCount: loadedPGNs.length,
            )
          : Center(
              child: MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: addPGN,
                child: const Text('Load PGN'),
              ),
            ),
      floatingActionButton: loadedPGNs.isNotEmpty
          ? FloatingActionButton(
              onPressed: addPGN,
              tooltip: 'Load PGN',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
