import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:film_camera_campanion/utilities/constants.dart';

import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../widgets/listPicker.dart';

class InformationBoard extends StatefulWidget {
  void setPosition(Position position) {
    _informationBoardState.setPosition(position);
  }

  void toggleSelected() {
    _informationBoardState.toggleSelected();
  }

  _InformationBoardState _informationBoardState = _InformationBoardState();

  @override
  _InformationBoardState createState() => _informationBoardState;
}

class _InformationBoardState extends State<InformationBoard> {
  //fields
  Position position = Position(latitude: 0, longitude: 0);
  bool selected = false;
  String aperture = '1.8';
  String shutter = '1/60';
  String lens = '50';

  PageController _pageController = PageController(initialPage: 0);

  //method
  void _setAperture(String value) {
    setState(() {
      aperture = value;
    });
  }

  void _setShutter(String value) {
    setState(() {
      shutter = value;
    });
  }

  void _setLens(String value) {
    setState(() {
      lens = value;
    });
  }

  void setPosition(Position position) {
    setState(() {
      this.position = position;
    });
  }

  void toggleSelected() {
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
      height: selected ? MediaQuery.of(context).size.height : 100,
      width: selected ? MediaQuery.of(context).size.width : 200,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.teal),
                  child: Text(
                    " $aperture",
                    style: kbodytextstyle,
                  ),
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
                    " ${shutter}S",
                    style: kbodytextstyle,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.teal),
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
                    " $lens MM",
                    style: kbodytextstyle,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.teal),
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
                    ' long:$longitude\n lat:$latitude',
                    style: kbodytextstyle,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.teal),
                ),
                flex: 2,
              )
            ],
          ),
          AnimatedContainer(
            height: selected ? MediaQuery.of(context).size.height / 2 : 0,
            duration: Duration(milliseconds: 300),
            child: PageView(
              controller: _pageController,
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "Aperture",
                          style: kbodytextstyle,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListPicker(
                          options: kapertureonethirdstop,
                          callback: _setAperture,
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "Shutter",
                          style: kbodytextstyle,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListPicker(
                          options: kshutterspeed,
                          callback: _setShutter,
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "Lens",
                          style: kbodytextstyle,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListPicker(
                          options: klens,
                          callback: _setLens,
                        ))
                  ],
                )
              ],
            ),
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
