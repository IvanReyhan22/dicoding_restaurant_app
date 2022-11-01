import 'package:open_resto/data/model/restaurant_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database _database;
  static DatabaseHelper? _databaseHelper;
  static const String _tableName = 'favourite';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'note_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
               id TEXT PRIMARY KEY, 
               name TEXT, 
               description TEXT, 
               pictureId TEXT, 
               city TEXT, 
               address TEXT, 
               rating REAL
             )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertRestaurant(Restaurant restaurant) async {
    final Database db = await database;
    await db.insert(_tableName, restaurant.toMap());
  }

  Future<List<Restaurant>> getNotes() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((res) => Restaurant.fromMap(res)).toList();
  }

  Future<dynamic> getRestaurantById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    final data = results.map((res) => Restaurant.fromMap(res));
    if (data.isNotEmpty) {
      return data.first;
    } else {
      print('Empty Data');
    }
  }

  Future<void> deleteNote(String id) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
