import 'package:flutter/material.dart';
import 'package:film_camera_campanion/utilities/constants.dart';

class InformationBoard extends StatelessWidget {
  const InformationBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Settings',
            style: TextStyle(
                color: Colors.white, fontSize: 48, fontWeight: FontWeight.w900),
          ),
          Text(
            'Aperture',
            style: kbodytextstyle,
          ),
        ],
      ),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kinformationboardcolor,
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }
}
