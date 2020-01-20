import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/utilities/constants.dart';

import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/constants.dart';

class InformationBoard extends StatefulWidget{

  void setPosition(Position position){
    _informationBoardState.setPosition(position);
  }

  void toggleSelected(){
    _informationBoardState.toggleSelected();
  }

  _InformationBoardState _informationBoardState = _InformationBoardState();

  @override
  _InformationBoardState createState() => _informationBoardState;
}

class _InformationBoardState extends State<InformationBoard>{

  //fields
  Position position = Position(latitude: 0,longitude: 0);
  bool selected = false;

  //method
  void setPosition(Position position){
    setState(() {
      this.position = position;
    });
  }

  void toggleSelected(){
    setState(() {
      selected = !selected;
    });
  }

  // build
  @override
  Widget build(BuildContext context) {

    double longitude = position.longitude;
    double latitude = position.latitude;

    return AnimatedContainer(
          height: selected? MediaQuery.of(context).size.height:100,
          width: selected? MediaQuery.of(context).size.width:200,
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Setting',
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
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kinformationboardcolor,
            borderRadius: BorderRadius.circular(22),
          ),
        );
  }
}