import 'package:drift_train/drift/drift_helper.dart';
import 'package:drift_train/drift/memo_repository.dart';
import 'package:flutter/material.dart';

class MemoTile extends StatelessWidget {
  MemoTile({Key? key, required this.memo, required this.memoRepository})
      : super(key: key);

  final Memo memo;

  // void Function()? onDelete;
  MemoRepository memoRepository;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(memo.content),
        subtitle: Text(memo.folder??""),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.brown,
          onPressed: () {
            memoRepository.deleteMemo(memo);
          },
        ),
      ),
    );
  }
}
