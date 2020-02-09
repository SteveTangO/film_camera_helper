import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/model/PictureData.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dotenv/dotenv.dart';

class Location {
  Location();
  Position position;

  Future<void> getLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    if (geolocationStatus == GeolocationStatus.granted) {
      //PictureData(position: position);
      print(position);
    } else {
      print('Permission not granted');
      //todo: implement a pop up alert to remind the user
    }
    print(geolocationStatus);
  }
}
