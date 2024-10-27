import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;

  DbHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'images.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE images(id INTEGER PRIMARY KEY AUTOINCREMENT, imagePath TEXT)',
        );
      },
    );
  }

  Future<void> insertImage(String imagePath) async {
    final db = await database;
    await db.insert(
      'images',
      {'imagePath': imagePath},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getImages() async {
    final db = await database;
    return await db.query('images');
  }
}
