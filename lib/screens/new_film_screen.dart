import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_dart/actor.dart';

import '../utilities/constants.dart';

class NewFilmScreen extends StatelessWidget {
  static String id = 'NewFilmScreen';
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  double filmmeasure = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Container(
              color: kkodakyellow,
            ),
          ),
//          Column(
//            children: <Widget>[
//              SizedBox(
//                height: 630,
//              ),
//              Text(
//                "  35mm",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 36,
//                    fontWeight: FontWeight.w800),
//              ),
//            ],
//          ),//just for playing
          Positioned(
            top: 500,
            child: Container(
              child: Animationss(),
              height: 420,
              width: 420,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Film Name',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 64),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 64),
                        onChanged: (value) {
                          print(value);
                        },
                        cursorColor: Colors.white,
                        autofocus: false,
                      ),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[Text("One"), Text("Two")],
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "  New",
                        style: TextStyle(
                            color: kkodakyellow,
                            fontSize: 40,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "  Film Roll",
                        style: TextStyle(
                            color: kkodakred,
                            fontSize: 40,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ChooseFilmSize(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "  NO.2",
                        style: TextStyle(
                            color: kkodakyellow,
                            fontSize: 36,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Animationss extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<Animationss> {
  @override
  Widget build(BuildContext context) {
    return new FlareActor(
      'images/kodakbackground.flr',
      animation: "push",
    );
  }
}

class ChooseFilmSize extends StatefulWidget {
  @override
  _ChooseFilmSizeState createState() => _ChooseFilmSizeState();
}

class _ChooseFilmSizeState extends State<ChooseFilmSize> {
  double filmmeasure = 3;
  String filmsize = "  35mm";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          filmsize,
          style: TextStyle(
              color: kkodakyellow, fontSize: 36, fontWeight: FontWeight.w800),
        ),
        Slider(
          value: filmmeasure,
          min: 1,
          max: 5,
          divisions: 5,
          onChanged: (double newvalue) {
            print(newvalue);
            setState(() {
              filmmeasure = newvalue;
              if (newvalue == 1) {
                filmsize = '8mm';
              } else if (newvalue == 1.8) {
                filmsize = '16mm';
              }
            });
          },
        ),
      ],
    );
  }
}
