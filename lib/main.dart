import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:film_camera_campanion/screens/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:film_camera_campanion/screens/new_film_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/loadingscreen.dart';
import 'package:film_camera_campanion/utilities/rotation_restriction.dart';

Future main() async{
  await DotEnv().load('credentials.env');
  runApp(MyApp());
}


class MyApp extends StatelessWidget with PortraitModeMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      initialRoute: NewFilmScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        NewFilmScreen.id: (context) => NewFilmScreen(),
        //LoadingScreen.id: (context) => LoadingScreen(),
      },
    );
  }
}
