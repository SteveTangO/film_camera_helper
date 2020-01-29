import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_dart/actor.dart';
import 'package:film_camera_campanion/utilities/filmstock.dart';
import '../utilities/constants.dart';

String filmsize = "35mm";

class NewFilmScreen extends StatelessWidget {
  NewFilmScreen({this.filmStockNo});

  static String id = 'NewFilmScreen';
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  double filmmeasure = 35; //dummy data
  int picsperfilm = 36;
  int filmiso = 200;
  int filmStockNo;

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
                              color: kkodakred,
                              fontWeight: FontWeight.w900,
                              fontSize: 64),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(
                            color: kkodakred,
                            fontWeight: FontWeight.w900,
                            fontSize: 64),
                        onChanged: (value) {
                          print(value);
                        },
                        cursorColor: kkodakred,
                        autofocus: false,
                      ),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text((filmiso).toString()),
                      Text((picsperfilm).toString()),
                    ],
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "New Film",
                          style: TextStyle(
                              color: kkodakyellow,
                              fontSize: 40,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Format",
                          style: TextStyle(
                              color: kkodakred,
                              fontSize: 40,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ChooseFilmSize(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "NO.$filmStockNo",
                          style: TextStyle(
                              color: kkodakyellow,
                              fontSize: 40,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: IconButtonReturn(
                                filmStockNo: filmStockNo,
                                filmiso: filmiso,
                                filmsize: filmsize,
                              )),
                        ],
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

  String returnFilmsize() {
    return filmsize;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 180,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            filmsize,
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            disabledThumbColor: Colors.white,
            disabledInactiveTrackColor: kkodakyellow,
            inactiveTickMarkColor: Colors.white,
            inactiveTrackColor: kkodakyellow,
            activeTrackColor: Colors.white,
            thumbColor: kkodakyellow,
//            thumbShape: RoundSliderOverlayShape(overlayRadius: 20),
            overlayColor: kkodakyellow,
          ),
          child: Slider(
            value: filmmeasure,
            min: 1,
            max: 5,
            divisions: 4,
            onChanged: (double newvalue) {
              print(newvalue);
              setState(() {
                filmmeasure = newvalue;
                if (newvalue == 1) {
                  filmsize = '8 mm';
                } else if (newvalue == 2) {
                  filmsize = '16 mm';
                } else if (newvalue == 3) {
                  filmsize = '35 mm';
                } else if (newvalue == 4) {
                  filmsize = 'MEDIUM';
                } else if (newvalue == 5) {
                  filmsize = 'LARGE';
                }
              });
            },
          ),
        ),
      ],
    );
  }
}

class IconButtonReturn extends StatefulWidget {
  int filmiso;
  int picsperfilm;
  int filmStockNo;
  String filmsize;

  IconButtonReturn(
      {this.picsperfilm, this.filmsize, this.filmiso, this.filmStockNo});

  @override
  _IconButtonReturnState createState() => _IconButtonReturnState();
}

class _IconButtonReturnState extends State<IconButtonReturn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.photo_camera,
            color: Colors.white,
            size: 60,
          ),
        ],
      ),
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                FilmStock newFilmStock = new FilmStock(
                    filmiso: this.widget.filmiso,
                    filmsize: this.widget.filmsize,
                    filmStockNo: this.widget.filmStockNo,
                    picsperfilm: this.widget.picsperfilm);
                return HomeScreen(newFilmStock: newFilmStock);
              },
            ),
          );
        });
      },
    );
  }
}
