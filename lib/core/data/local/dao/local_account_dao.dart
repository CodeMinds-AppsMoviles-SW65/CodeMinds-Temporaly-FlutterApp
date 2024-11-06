import 'package:flutter_project/core/data/local/app_database.dart';
import 'package:flutter_project/core/data/local/entity/local_account_entity.dart';
import 'package:sqflite/sqflite.dart';

class LocalAccountDao {
  /// Save account to local database
  /// Use [AppDatabase] to get database instance
  /// Use [insert] method to insert account to database
  Future<void> saveAccount(LocalAccountEntity account) async {
    final db = await AppDatabase().init();
    await db.insert(
      AppDatabase().tableName,
      account.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Get account from local database
  /// Use [AppDatabase] to get database instance
  Future<LocalAccountEntity?> getAccount() async {
    final db = await AppDatabase().init();
    final maps = await db.query(AppDatabase().tableName);
    if (maps.isNotEmpty) {
      return LocalAccountEntity.fromMap(maps.first);
    }
    return null;
  }
}
