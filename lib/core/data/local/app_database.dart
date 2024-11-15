import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = "temporaly.db";
  final String tableName = "accounts";

  Database? _database;

  Future<Database> init() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) {
        print("Creating table $tableName...");
        db.execute('''
          CREATE TABLE $tableName(
            id TEXT PRIMARY KEY,
            username TEXT,
            token TEXT
          )
        ''');
      },
    );
    return _database!;
  }
}
