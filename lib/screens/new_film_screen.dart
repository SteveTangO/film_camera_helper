import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:film_camera_campanion/widgets/listPicker.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_dart/actor.dart';
import 'package:film_camera_campanion/utilities/filmstock.dart';
import '../utilities/constants.dart';
import 'package:film_camera_campanion/utilities/size_config.dart';

// re-sizing in completed in this page

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
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false, // super useful
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
            top: SizeConfig.blockSizeVertical * 30,
            child: Container(
              child: Animationss(),
              height: SizeConfig.blockSizeVertical * 66,
              width: SizeConfig.screenWidth,
            ),
          ),
          SafeArea(
            child: Container(
              width: SizeConfig.screenWidth,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 3,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    //color: Colors.blue,
                    height: SizeConfig.safeBlockVertical * 25,
                    child: TextField(
                      //TODO finish the type process of text input  done
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.characters,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'Film Name',
                        hintStyle: TextStyle(
                            color: kkodakred,
                            fontWeight: FontWeight.w900,
                            fontSize: SizeConfig.safeBlockHorizontal * 16),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 8
                        ),
                        height: SizeConfig.safeBlockVertical * 32,
                        width: SizeConfig.safeBlockHorizontal*45,
                        //color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: SizeConfig.safeBlockVertical * 5,
                                  child: ListPicker(
                                    options: kEXR,
                                    scrollDirection: Axis.horizontal,
                                    horizontalLine: false,
                                    itemWidth: SizeConfig.safeBlockHorizontal*16.5,
                                    selectedStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800
                                    ),
                                  ),
                                ),
                                Container(
                                  width: SizeConfig.safeBlockHorizontal * 12,
                                  child: Center(
                                    child: Text("EXR",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: SizeConfig.safeBlockVertical*3,
                                        fontWeight: FontWeight.w900
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              color: Colors.black,
                              height: SizeConfig.safeBlockVertical/1.1,
                              width: SizeConfig.safeBlockHorizontal * 27,
                            ),
                            Container(
                              height: SizeConfig.safeBlockVertical * 14,
                              width: SizeConfig.safeBlockHorizontal*27,
                              child: ListPicker(
                                options: kISO,
                                horizontalLine: false,
                                defaultStyle: TextStyle(
                                  color: Colors.grey,
                                    fontSize: SizeConfig.safeBlockVertical * 2,
                                    fontWeight: FontWeight.w600
                                ),
                                selectedStyle: TextStyle(
                                  color: Colors.black,
                                    fontSize: SizeConfig.safeBlockVertical * 2.1,
                                    fontWeight: FontWeight.w900
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 39,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
//                        Container(
//                          height: SizeConfig.safeBlockVertical * 7,
//                          margin: EdgeInsets.symmetric(horizontal: 20),
//                          child: Text(
//                            "New Film",
//                            style: TextStyle(
//                                color: kkodakyellow,
//                                fontSize: SizeConfig.safeBlockHorizontal * 10,
//                                fontWeight: FontWeight.w800),
//                          ),
//                        ),

                        Container(
                          height: SizeConfig.safeBlockVertical * 7,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 8),
                          child: Text(
                            "Film Format",
                            style: TextStyle(
                                color: kkodakyellow,
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1,
                        ),
                        ChooseFilmSize(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: SizeConfig.safeBlockVertical * 7,
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal * 8),
                              child: Text(
                                "NO.$filmStockNo",
                                style: TextStyle(
                                    color: kkodakyellow,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 10,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 12,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.safeBlockHorizontal * 10),
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
    return Container(
      height: SizeConfig.safeBlockVertical * 17,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 3,
          ),
          Column(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: SizeConfig.safeBlockHorizontal * 60,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 5), //20
                child: Text(
                  filmsize,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.safeBlockHorizontal * 12,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  disabledThumbColor: Colors.white,
                  disabledInactiveTrackColor: kkodakyellow,
                  inactiveTickMarkColor: Colors.white,
                  inactiveTrackColor: kkodakyellow,
                  activeTrackColor: kkodakyellow,
                  thumbColor: kkodakyellow,
//            thumbShape: RoundSliderOverlayShape(overlayRadius: 20),
                  overlayColor: kkodakyellow,
                ),
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 50,
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
              ),
            ],
          ),
        ],
      ),
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
            size: SizeConfig.safeBlockHorizontal * 12,
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
