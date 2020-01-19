import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/utilities/constants.dart';

import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/constants.dart';

class InformationBoard extends StatelessWidget {
  Position position;
  double animationvalue;
  double margin = 1;

  InformationBoard({this.position, this.animationvalue, this.margin});

  @override
  Widget build(BuildContext context) {
    double longitude = position.longitude;
    double latitude = position.latitude;
    return Container(
      height: 200*animationvalue+200,
      padding: EdgeInsets.all(40),
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
      margin: EdgeInsets.all(margin*20*animationvalue),
      decoration: BoxDecoration(
        color: kinformationboardcolor,
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }
}
