import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version =  1;
  final String databaseName = "temporaly.db";
  final String tableName = "accounts";

  Database? _database;

  Future<void> init() async {
    _database = await openDatabase(
      databaseName,
      version: version,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $tableName(
          id text primary key,
          username text,
          token text,
        ''');
      },
    );
  }
}