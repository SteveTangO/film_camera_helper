import 'package:flutter/material.dart';
import 'package:film_camera_campanion/services/locations.dart';
import 'package:geolocator/geolocator.dart'; //location service package
//authorisation functions in both systems are implemented
import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:film_camera_campanion/screens/new_film_screen.dart';
import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/widgets/information_board.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/home_background.png")),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            InformationBoard(),
            //add the horizontal ListView widget
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 42,
                itemBuilder: (BuildContext context, int index) {
                  int filmcardserial = index + 1;
                  return Container(
                    width: 181,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(20),
                    child: Center(child: Text('$filmcardserial')),
                    decoration: BoxDecoration(
                      color: kfilmcardcolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
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
            ),
            SizedBox(
              height: 140,
            ),
          ],
        ),
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
