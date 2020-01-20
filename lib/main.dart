import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:film_camera_campanion/screens/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:film_camera_campanion/screens/new_film_screen.dart';
import 'screens/loadingscreen.dart';
import 'package:dotenv/dotenv.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoadingScreen.id,
      routes: {
        //HomeScreen.id: (context) => HomeScreen(),
        NewFilmScreen.id: (context) => NewFilmScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
      },
    );
  }
}

// This is my comment!!!!!! Dixon