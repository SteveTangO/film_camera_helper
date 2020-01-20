import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:flutter/material.dart';

class NewFilmScreen extends StatelessWidget {
  static String id = 'NewFilmScreen';
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber[500],
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
                    Text("New", style: TextStyle(color: Colors.red, fontSize: 40, fontWeight: FontWeight.w800),),
                    Text("Film Roll", style: TextStyle(color: Colors.red, fontSize: 40, fontWeight: FontWeight.w800),)
                  ],
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("One"),
                  Text("Two")
                ],
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
            Expanded(
              child: SizedBox(),
              flex: 1,
            )
          ],
        ),
      );
  }
}
