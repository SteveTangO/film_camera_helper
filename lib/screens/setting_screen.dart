import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:film_camera_campanion/widgets/information_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/utilities/constants.dart';

import '../utilities/constants.dart';

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
                  children: <Widget>[
                    Expanded(
                      flex: 2,
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
                                  child: Text("",style: kbodytextstyle,),
                                  color: Colors.teal,
                                ),
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(child: Text("Shutter ",style: kbodytextstyle,),flex: 1,),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "", style: kbodytextstyle,
                                  ),
                                  color: Colors.teal,
                                ),
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(child: Text("Lens ",style: kbodytextstyle,),flex: 1,),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "", style: kbodytextstyle,
                                  ),
                                  color: Colors.teal,
                                ),
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(child: Text("Location ",style: kbodytextstyle,),flex: 1,),
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
                      flex: 3,
                      child: Center(child: Text("Cupertino widget",style: kbodytextstyle,),),
                    )
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
