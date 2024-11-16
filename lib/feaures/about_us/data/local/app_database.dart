import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:logger/logger.dart';

class AppDatabase {
  static const String _databaseName = 'about_us.db';
  static const String _tableName = 'consents';
  static const int _databaseVersion = 1;
  final Logger logger = Logger();

  Database? _database;

  /// Open or create the database
  Future<Database> openDb() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id TEXT PRIMARY KEY,
            accepted INTEGER,
            acceptedDate TEXT
          )
        ''');
      },
    );
    return _database!;
  }

  /// Insert consent into the database
  Future<void> insertConsent(String id, bool accepted, DateTime acceptedDate) async {
    final db = await openDb();
    await db.insert(
      _tableName,
      {
        'id': id,
        'accepted': accepted ? 1 : 0,
        'acceptedDate': acceptedDate.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Get a consent by its ID
  Future<Map<String, dynamic>?> getConsentById(String id) async {
    final db = await openDb();
    final result = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getAllConsents() async {
    final db = await openDb();
    final result = await db.query(_tableName);
    logger.i('Datos en la base de datos: $result');
    return result;
  }

}
