import 'package:flutter/material.dart';
import 'package:film_camera_campanion/services/locations.dart';
import 'package:geolocator/geolocator.dart'; //location service package
//authorisation functions in both systems are implemented
import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:film_camera_campanion/screens/new_film_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool selected = false;

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
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.all(30),
              duration: Duration(seconds: 1),
              child: Text('current  information'),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: selected ? Colors.teal : Colors.blue,
                borderRadius: BorderRadius.circular(selected ? 10 : 40),
              ),
            ),
          ),
          Container(
            child: FlatButton(
                child: Container(
                  child: Text('new film'),
                ),
                color: Colors.teal,
                onPressed: () {
                  FilmStock newfilm = new FilmStock(filmstockserial: 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NewFilmScreen();
                      },
                    ),
                  );
                }),
          )
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
