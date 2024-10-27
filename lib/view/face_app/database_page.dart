// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   static Database? _database;
//
//   factory DatabaseHelper() => _instance;
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
//     String path = join(await getDatabasesPath(), 'face_recognition.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE faces(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, imagePath TEXT)",
//         );
//       },
//     );
//   }
//
//   Future<void> insertFace(String name, String imagePath) async {
//     final db = await database;
//     await db.insert(
//       'faces',
//       {'name': name, 'imagePath': imagePath},
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   Future<List<Map<String, dynamic>>> getFaces() async {
//     final db = await database;
//     return await db.query('faces');
//   }
// }




import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'faces.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE faces(id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT)',
        );
      },
    );
  }

  Future<void> insertFace(String image) async {
    final db = await database;
    await db.insert(
      'faces',
      {'image': image},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getFaces() async {
    final db = await database;
    return await db.query('faces');
  }
}
