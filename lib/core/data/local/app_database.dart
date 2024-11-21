import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:logger/logger.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = "temporaly.db";
  final String tableName = "accounts";
  final Logger logger = Logger();

  Database? _database;

  Future<Database> init() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) {
        logger.i("Creating table $tableName...");
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
