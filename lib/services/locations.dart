import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/utilities/PictureData.dart';

class Location {
  Location();

  Future<void> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    if (geolocationStatus == GeolocationStatus.granted) {
      PictureData(position: position);
      print(position);
    } else {
      print('Permission not granted');
      //todo: implement a pop up alert to remind the user
    }
    print(geolocationStatus);
  }
}
