import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:film_camera_campanion/widgets/information_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/utilities/constants.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  static Position position = new Position(longitude: 0, altitude: 0);
  double longitude = position.longitude;
  double latitude = position.latitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => HomeScreen(
                        position: position,
                      )));
        },
        child: SizedBox.expand(
          child: Container(
            color: kbackgroundcolor,
            child: Hero(
              tag: 'board',
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Settings',
                      style: ksettingtextstyle,
                    ),
                    Text(
                      'Aperture',
                      style: kbodytextstyle,
                    ),
                    Text(
                      '$longitude//$latitude',
                      style: kbodytextstyle,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: kinformationboardcolor,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
