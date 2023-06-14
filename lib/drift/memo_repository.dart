import 'package:drift/drift.dart';
import 'package:drift_train/drift/drift_helper.dart';
import 'package:flutter/material.dart';

class MemoRepository extends ChangeNotifier {
  //field

  final Mydatabase _myDatabase;

  //// Single
  static final MemoRepository _memoRepository = MemoRepository._inner();

  MemoRepository._inner() : _myDatabase = Mydatabase();

  factory MemoRepository() {
    return _memoRepository;
  }

/////
  // 메모삽입
  Future<int> saveMemo(
      {required String content, String category = "기본"}) async {
    int id = await _myDatabase.into(_myDatabase.memos).insert(
        MemosCompanion.insert(content: content, folder: Value(category)));
    return id;
  }

  // 메모 수정
  Future<int> updateMemo(Memo memo) async {
    return await (_myDatabase.update(_myDatabase.memos)
          ..where((tbl) => tbl.id.equals(memo.id)))
        .write(memo);
  }

  // 메모 삭제
  Future<int> deleteMemo(Memo memo) async {
    return await (_myDatabase.delete(_myDatabase.memos)
          ..where((t) => t.id.equals(memo.id)))
        .go();
  }

  //메모 전체 읽기
  Stream<List<Memo>> readAll() {
    return _myDatabase.select(_myDatabase.memos).watch();
  }

  //폴더 별 출력
  Future<List<String>> readCategory() {
    return (_myDatabase.selectOnly(_myDatabase.memos, distinct: true)
          ..addColumns([_myDatabase.memos.folder]))
        .map((row) => row.read(_myDatabase.memos.folder)!)
        .get();
  }

  //폴더만 리스트로
  Stream<List<Memo>> readMemoWithCategory(String folder) {
    return (_myDatabase.select(_myDatabase.memos)
          ..where((tbl) => tbl.folder.equals(folder)))
        .watch();
  }
}
