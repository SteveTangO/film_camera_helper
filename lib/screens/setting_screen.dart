/*import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:film_camera_campanion/utilities/PictureData.dart';
import 'package:film_camera_campanion/widgets/information_board.dart';
import 'package:film_camera_campanion/widgets/listPicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/utilities/constants.dart';

import '../utilities/constants.dart';
import 'package:flutter/cupertino.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  static Position position = new Position(longitude: 0, altitude: 0);
  double longitude = position.longitude;
  double latitude = position.latitude;
  PictureData pictureData = PictureData();
  double aperture = 0;
  int shutter = 0;
  int lens = 0;

  void _setAperture(double value){
    setState(() {
      aperture = value;
    });
  }

  void _setShutter(double value){
    shutter = value.toInt();
  }

  void _setLens(double value){
    lens = value.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox.expand(
          child: Container(
            color: kbackgroundcolor,
            child: Hero(
              tag: 'board',
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Settings',
                                style: ksettingtextstyle,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Aperture ',
                                  style: kbodytextstyle,
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "$aperture",
                                    style: kbodytextstyle,
                                  ),
                                  color: Colors.teal,
                                ),
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Shutter ",
                                  style: kbodytextstyle,
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "1/$shutter",
                                    style: kbodytextstyle,
                                  ),
                                  color: Colors.teal,
                                ),
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Lens ",
                                  style: kbodytextstyle,
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "$lens",
                                    style: kbodytextstyle,
                                  ),
                                  color: Colors.teal,
                                ),
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Location ",
                                  style: kbodytextstyle,
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'long:$longitude\nlat:$latitude',
                                    style: kbodytextstyle,
                                  ),
                                  color: Colors.teal,
                                ),
                                flex: 2,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Center(child: Text("Aperture", style: kbodytextstyle,),
                            ),
                          ),
                          Expanded(
                            flex:2,
                            child: ListPicker(
                              options: [100,200,300,400,500,600,700,800,900,1000],
                              intValue: true,
                              callback: _setAperture,
                            )
                          ),
                        ],
                      ),
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


 */