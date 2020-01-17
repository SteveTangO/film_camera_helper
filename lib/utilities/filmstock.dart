import 'package:flutter/material.dart';
import 'package:film_camera_campanion/utilities/PictureData.dart';

class FilmStock{
  int filmstockserial;
  List<PictureData> filmroll = new List(42);
  FilmStock({this.filmstockserial});
}