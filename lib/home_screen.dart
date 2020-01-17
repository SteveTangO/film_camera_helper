import 'package:flutter/material.dart';
import 'locations.dart';
import 'package:geolocator/geolocator.dart'; //location service package
//authorisation functions in both systems are implemented

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film Camera Campanion'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.teal,
            padding: EdgeInsets.all(30),
            child: Text('current  information'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            Location location = Location(); //construct a location object
            await location
                .getLocation(); //utilise the getlocation function from Location class
            //todo: associate the location with other information
          } catch (e) {
            print('fail to acquire location');
            //todo: add an alert
          }
        },
        label: Text('record'),
        icon: Icon(Icons.camera_roll),
        backgroundColor: Colors.teal,
        elevation: 10.0,
      ),
    );
  }
}
