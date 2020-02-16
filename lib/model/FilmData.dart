import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class FilmData{
  int _filmNo;
  int _iso;
  String _filmname;
  int _exr;
  String _date;
  String _company;
  String _format;

  FilmData(
        this._filmNo, this._iso, this._filmname, this._exr,
      this._company, this._format
      ){
    this._date = DateTime.now().toString();
  }

  int get filmNo => _filmNo;
  int get iso => _iso;
  String get filmname => _filmname;
  int get exr => _exr;
  String get date => _date;
  String get company => _company;
  String get format => _format;

  set iso(int newIso){
    this._iso = newIso;
  }

  set filmname(String newFilmname){
    this._filmname = newFilmname;
  }

  set exr(int newExr){
    this._exr = newExr;
  }

  set company(String newCompany){
    this._company = newCompany;
  }

  set format (String newFormat){
    this._format = newFormat;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if (_filmNo != null){
      map['filmNo'] = _filmNo;
    }
    map['iso'] = _iso;
    map['filmname'] = _filmname;
    map['exr'] = _exr;
    map['date'] = _date;
    map['company'] = _company;
    map['format'] = _format;
    return map;

  }
  FilmData.fromMap( Map<String, dynamic> map){
    this._filmNo = map['filmNo'];
    this._iso = map['iso'];
    this._filmname = map['filmname'];
    this._exr = map['exr'];
    this._date = map['date'];
    this._company = map['company'];
    this._format = map['format'];
  }





}