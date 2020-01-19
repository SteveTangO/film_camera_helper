import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:flutter/material.dart';

class NewFilmScreen extends StatelessWidget {
  static String id = 'NewFilmScreen';
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Film'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(20),
          scrollDirection: Axis.horizontal,
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }),
    );
  }
}
