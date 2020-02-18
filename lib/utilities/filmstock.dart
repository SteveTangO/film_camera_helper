import 'package:flutter/material.dart';
import 'package:film_camera_campanion/model/PictureData.dart';

class FilmStock{
  int filmStockNo;
  String filmsize;
  int picsperfilm;
  int filmiso;
  List<PictureData> filmroll = new List(42);
  FilmStock({this.filmStockNo, this.filmsize, this.filmiso, this.picsperfilm});
}