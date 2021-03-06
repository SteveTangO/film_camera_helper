import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PictureData {
  int _picserial;
  int _localserial;
  int _filmstockserial; //this pic is in which film stock
  String _aperture;
  String _shutterspeed;
  String _lens;
  String _time; //time shall not be changed
  Position _position; //maybe user could update manully

  PictureData(this._filmstockserial, this._aperture, this._shutterspeed,
      this._lens, this._position) {
    this.time = DateTime.now().toString();
  }

  PictureData.withPicserial(
      this._picserial,
      this._filmstockserial,
      this._aperture,
      this._shutterspeed,
      this._lens,
      this._time,
      this._position);

  int get picserial => _picserial;

  int get localserial => _localserial;

  int get filmstockserial => _filmstockserial;

  String get aperture => _aperture;

  String get shutterspeed => _shutterspeed;

  String get lens => _lens;

  String get time => _time;

  Position get position => _position;

  set aperture(String newAperture) {
    this._aperture = newAperture;
  }

  set shutterspeed(String newShutterspeed) {
    this._shutterspeed = newShutterspeed;
  }

  set lens(String newLens) {
    this._lens = newLens;
  }

  set time(String newTime) {
    this._time = newTime;
  }

  set position(Position newPosition) {
    this._position = newPosition;
  }

  //convert the PictureData object to a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    try{
      if (_picserial != null) {
        map['picserial'] = _picserial;
      }
      map['localserial'] = _localserial;
      map['filmstockserial'] = _filmstockserial;
      map['aperture'] = _aperture;
      map['shutterspeed'] = _shutterspeed;
      map['lens'] = _lens;
      map['time'] = _time;
      map['positionlatitude'] = 'NA';
      map['positionlongitude'] = 'NA';
    }
    catch(e){
      print("toMap() failed");
    }
    //map['position'] = _position;
    return map;
  }

  PictureData.fromMapObject(Map<String, dynamic> map) {
    this._picserial = map['picserial'];
    this._localserial = map['localserial'];
    this._filmstockserial  = map['filmstockserial'];
    this._aperture = map['aperture'];
    this._shutterspeed = map['shutterspeed'];
    this._lens = map['lens'];
    this._time = map['time'];
    try{
      double latitude = double.parse(map['positionlatitude']); // remember to handle the exception
      double longitude = double.parse(map['positionlongitude']);
      this._position = new Position(latitude: latitude, longitude: longitude);
    }
    catch(positiondatamissing){
      this._position = new Position();
    }
    print("from map transfer done"); //debug
  }
}
