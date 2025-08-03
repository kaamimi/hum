import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '/models/entry.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'hum.db');

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  static Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE entries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imagePath TEXT NOT NULL,
        date TEXT NOT NULL,
        note TEXT,
        mood TEXT
      )
    ''');
  }

  static Future<List<HumEntry>> getAllEntries() async {
    final db = await database;
    final data = await db.query('entries', orderBy: 'date DESC');
    return data.map((e) => HumEntry.fromMap(e)).toList();
  }

  static Future<int> insertEntry(HumEntry entry) async {
    final db = await database;
    return await db.insert(
      'entries',
      entry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteEntry(int id) async {
    final db = await database;
    await db.delete('entries', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateEntry(HumEntry entry) async {
    final db = await database;
    await db.update(
      'entries',
      entry.toMap(),
      where: 'id = ?',
      whereArgs: [entry.id],
    );
  }
}
