import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'user_tables.g.dart';

class UserItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 32)();
  TextColumn get lastName => text().nullable().withLength(min: 3, max: 32)();
  TextColumn get dateOfBirth => text().nullable().withLength(min: 3, max: 32)();
  TextColumn get password => text().withLength(min: 6, max: 32).unique()();
  TextColumn get mail => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

@DriftDatabase(tables: [UserItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // важно, если уже была проинициализированна одна таблица с
  //такой версией, то создать новую не получится
  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() => driftDatabase(name: 'my_database');
}
