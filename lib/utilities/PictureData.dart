import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PictureData {
  final String time = (DateTime.now()).toString(); //time shall not be changed
  Position position;
  double aperture;
  int shutterspeed;
  int filmstockserial;    //this pic is in which film stock
  int picserial;


  PictureData(
      {this.shutterspeed, this.aperture, this.position, this.picserial, this.filmstockserial});
}
