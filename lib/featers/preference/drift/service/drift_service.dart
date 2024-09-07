import '../tables/user/user_tables.dart';

class DriftService {
  DriftService() {
    init();
  }
  AppDatabase? database;

  void init() {
    if (database != null) return;
    database = AppDatabase();
  }
}
