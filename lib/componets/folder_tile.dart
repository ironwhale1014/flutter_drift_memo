import 'package:flutter/material.dart';

class FolderTile extends StatelessWidget {
  FolderTile({Key? key, required this.folder}) : super(key: key);

  String folder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(folder),
      ),
    );
  }
}
