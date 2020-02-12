import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:film_camera_campanion/model/PictureData.dart';
import 'dart:io';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String pictureTable = 'picture_table';
  String colPicserial = 'picserial';
  String colFilmstockserial = 'filmstockserial';
  String colAperture = 'aperture';
  String colShutterspeed = 'shutterspeed';
  String colLens = 'lens';
  String colTime = 'time';
  String colPosition = 'position';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'picsdata.db');

    var picsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDB);
    return picsDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $pictureTable($colPicserial INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colFilmstockserial INTEGER, $colAperture TEXT, $colShutterspeed TEXT, '
        '$colLens TEXT, $colTime TEXT, $colPosition TEXT)');
  }

  //implement CRUD operations

  // Insert operation
  Future<int> insertPic(PictureData pictureData) async {
    Database db = await this.database;
    var result = await db.insert(pictureTable, pictureData.toMap());
    return result;
  }

//other functions to be implemented later

}
