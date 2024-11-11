import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class ImageService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "images.db");
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Images(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imagePath TEXT
      )
    ''');
  }

  Future<void> insertImage(String imagePath) async {
    final db = await database;
    await db.insert('Images', {'imagePath': imagePath});
  }

  Future<List<String>> getImages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Images');
    return List.generate(maps.length, (i) {
      return maps[i]['imagePath'] as String;
    });
  }

  Future<String> saveImage(XFile image) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String imagesDirPath = join(appDocDir.path, 'view/Fcm_page/images');

    // Create the images directory if it doesn't exist
    await Directory(imagesDirPath).create(recursive: true);

    String imagePath = join(imagesDirPath, basename(image.path));

    // Copy the image to the new path
    await File(image.path).copy(imagePath);

    return imagePath;
  }
}
