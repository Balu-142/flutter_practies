// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   static Database? _database;
//
//   factory DatabaseHelper() {
//     return _instance;
//   }
//
//   DatabaseHelper._internal();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }
//
//   Future<Database> _initDB() async {
//     String path = join(await getDatabasesPath(), 'images.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE images(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             path TEXT
//           )
//         ''');
//       },
//     );
//   }
//
//   Future<void> insertImage(String path) async {
//     final db = await database;
//     await db.insert('images', {'path': path});
//   }
//
//   Future<List<String>> getImages() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('images');
//     return List.generate(maps.length, (i) {
//       return maps[i]['path'] as String;
//     });
//   }
// }




/// lib/database_helper.dart (ensure this code is correct)



import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('faces.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE faces (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imagePath TEXT,
        timestamp TEXT
      )
    ''');
  }

  Future<void> insertFace(String name, String imagePath, String timestamp) async {
    final db = await database;

    //    String timestamp = DateTime.now() as String;

    String timestamp = DateTime.now().toIso8601String();
    await db.insert('faces', {
      'name': name,
      'imagePath': imagePath,
      'timestamp': timestamp,
    });
  }

  Future<List<Map<String, dynamic>>> getFaces() async {
    final db = await database;
    return await db.query('faces');
  }

  Future<void> updateFaceName(String newName, String imagePath) async {
    final db = await database;
    await db.update(
      'faces',
      {'name': newName},
      where: 'imagePath = ?',
      whereArgs: [imagePath],
    );
  }
}
