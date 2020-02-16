import 'dart:async';
import 'package:film_camera_campanion/model/FilmData.dart';
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
  String colLocalserial = 'localserial';
  String colFilmstockserial = 'filmstockserial';
  String colAperture = 'aperture';
  String colShutterspeed = 'shutterspeed';
  String colLens = 'lens';
  String colTime = 'time';
  String colPositionLatitude = 'positionlatitude';
  String colPositionLongitude = 'positionlongitude';

  String filmTable = 'film_table';
  String colFilmNo = 'filmNo';
  String colIso = 'iso';
  String colFilmname = 'filmname';
  String colExr = 'exr';
  String colDate = 'date';
  String colCompany = 'company';
  String colFormat = 'format';

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
        '$colLocalserial INTEGER, $colFilmstockserial INTEGER, '
        '$colAperture TEXT, $colShutterspeed TEXT, '
        '$colLens TEXT, $colTime TEXT, $colPositionLatitude TEXT, $colPositionLongitude TEXT,'
            'FOREIGN KEY ($colFilmstockserial) REFERENCES $filmTable ($colFilmNo))');
    await db.execute(
        'CREATE TABLE $filmTable($colFilmNo INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colIso INTEGER, $colFilmname TEXT, $colExr INTEGER, $colDate TEXT, $colCompany TEXT, '
        '$colFormat TEXT)');
  }

  //implement CRUD operations

  //CRUD of picture table
  // Insert operation
  Future<int> insertPic(PictureData pictureData) async {
    Database db = await this.database;
    var result = await db.insert(pictureTable, pictureData.toMap());
//    print(pictureData.toMap()); //debug
    return result;
  }

//other functions to be implemented later
//read the data
  Future<PictureData> readPic(int picserial) async {
    Database db = await this.database;
    var result = await db.rawQuery(
        'SELECT * FROM $pictureTable WHERE $colPicserial = $picserial');
    //print(result);
    Map picData = result[0];
    PictureData pictureData = PictureData.fromMapObject(picData);
    return pictureData;
  }

  //return the serial of the last picture the film has recorded
  Future<int> locatePic() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $pictureTable ORDER '
        'BY $colPicserial DESC LIMIT 1');
    int picserial;
    //first time opening the app
    try {
      Map picdata = result[0];
      picserial = picdata['picserial'];
    } catch (e) {
      picserial = 1;
    }
    return picserial;
  }

  //CRUD of film table
  Future<int> insertFilm(FilmData filmData) async {
    Database db = await this.database;
    var result = await db.insert(filmTable, filmData.toMap());
    print(filmData.toMap()); //debug
    return result;
  }

  //get the filmNO of the last row in the table
  Future<int> getLastFilmNO()async{
    Database db = await this.database;
    var result = await db.rawQuery('SELECT $colFilmNo FROM $filmTable ORDER BY '
        '$colFilmNo DESC LIMIT 1');
    int filmno;
    try{
      Map filmdata = result[0];
      filmno = filmdata['filmNo'];
    }
    catch(e){
      filmno = 0;
    }
    return filmno;
  }
}
