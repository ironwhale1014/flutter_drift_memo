import 'package:drift/drift.dart';

class Memos extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get content => text()();
  TextColumn get folder => text().withDefault(const Constant("기본")).nullable()();
}
