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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "New",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 40,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Film Roll",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 40,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[Text("One"), Text("Two")],
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("mm"),
                      Text("Film Name"),
                      Text("Serial Number")
                    ],
                  ),
                  flex: 3,
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
