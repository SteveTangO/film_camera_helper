import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/services/locations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
/*
class LoadingScreen extends StatefulWidget {
  static String id = 'LoadingScreen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getlocation();
  }

  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: Text("Alert"),
        content: Text('Alert'),
      ),
    );
  }

  void getlocation() async {
    try {
      Location location = Location(); //construct a location object
      await location
          .getLocation(); //utilise the getlocation function from Location class
      //todo: associate the location with other information
      Position position = location.position;
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => HomeScreen(position: position),
          ));
    } catch (e) {
      print('fail to acquire location');
      //todo: add an alert
      Position unavailableposition = Position(longitude: 0, latitude: 0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            position: unavailableposition,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF737499),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: SizedBox(
                  height: 120,
                  width: 300,
                  child: Text(
                    'Film Camera',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 50),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


 */