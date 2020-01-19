import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/utilities/constants.dart';

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
      margin: EdgeInsets.all(margin*20*animationvalue),
      decoration: BoxDecoration(
        color: kinformationboardcolor,
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }
}
