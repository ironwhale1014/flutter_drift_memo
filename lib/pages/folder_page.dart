import 'package:drift_train/componets/folder_tile.dart';
import 'package:drift_train/drift/memo_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';

class FolderPage extends StatelessWidget {
  FolderPage({Key? key}) : super(key: key);

  final MemoRepository _memoRepository = MemoRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("폴더별")),
      body: StreamBuilder<List<String>>(
        stream: _memoRepository.readCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> folderList = snapshot.data!;
            return ListView.builder(
                itemCount: folderList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        logger.d("go folder");
                        context.pushNamed("folder", extra: folderList[index]);
                      },
                      child: FolderTile(folder: folderList[index]));
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}
