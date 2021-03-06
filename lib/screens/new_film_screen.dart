import 'package:film_camera_campanion/model/FilmData.dart';
import 'package:film_camera_campanion/screens/home_screen.dart';
import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/utilities/database.dart';
import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:film_camera_campanion/widgets/listPicker.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_dart/actor.dart';
import 'package:film_camera_campanion/utilities/filmstock.dart';
import '../utilities/constants.dart';
import 'package:film_camera_campanion/utilities/size_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// re-sizing in completed in this page
//TODO cancel the focus of the textfield when not typing

String filmsize = "35mm";
double filmmeasure = 35; //dummy data
int picsperfilm = 36;
int filmiso = 200;
int filmStockNo = 1;
String inputtext;
DatabaseHelper helper = DatabaseHelper();

class NewFilmScreen extends StatelessWidget {


  static String id = 'NewFilmScreen';
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    _update();
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
//                  SizedBox(
//                    height: SizeConfig.safeBlockVertical * 1,
//                  ),
                  FilmNamer(), //height safevertical 25
                  ISOselector(), //height
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
                              width: SizeConfig.safeBlockHorizontal * 20,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.safeBlockHorizontal * 5),
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
  void _update()async{
    filmStockNo = await _getfilmNO();
  }

  Future<int> _getfilmNO() async{
    int result;
    result = await helper.getLastFilmNO();
    return result;
  }
}

class FilmNamer extends StatelessWidget {
  const FilmNamer({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
              fontSize: SizeConfig.safeBlockHorizontal * 15),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(
            color: kkodakred,
            fontWeight: FontWeight.w900,
            fontSize: SizeConfig.safeBlockHorizontal * 15),
        onChanged: (value) {
          inputtext = value;
          print(value);
        },
        cursorColor: kkodakred,
        autofocus: false,
      ),
    );
  }
}

class ISOselector extends StatelessWidget {
  const ISOselector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 6),
          height: SizeConfig.safeBlockVertical * 32,
          width: SizeConfig.safeBlockHorizontal * 80,
          //color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 9,
                    child: ListPicker(
                      options: kEXR,
                      scrollDirection: Axis.horizontal,
                      horizontalLine: true,
                      itemWidth: SizeConfig.safeBlockHorizontal * 20,
                      defaultStyle: TextStyle(
                          color: Color(0xFFB68500),
                          fontSize: SizeConfig.safeBlockHorizontal * 8),
                      selectedStyle: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 22,
                    height: SizeConfig.safeBlockVertical * 9,
                    child: Align(
                      alignment: Alignment(1.0, 1.0),
                      child: Text(
                        "EXR",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockVertical * 6,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.black,
                height: SizeConfig.safeBlockVertical / 2,
                width: SizeConfig.safeBlockHorizontal * 42,
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 15,
                width: SizeConfig.safeBlockHorizontal * 42,
                child: ListPicker(
                  options: kISO,
                  horizontalLine: false,
                  defaultStyle: TextStyle(
                      color: Color(0xFFB68500),
                      fontSize: SizeConfig.safeBlockHorizontal * 8),
                  selectedStyle: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 16,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        ),
      ],
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
                  width: SizeConfig.safeBlockHorizontal * 70,
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
  Future<int> _getfilmNO() async{
    int result;
    result = await helper.getLastFilmNO();
    return result;
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
            color: kkodakyellow,
            size: SizeConfig.safeBlockHorizontal * 12,
          ),
        ],
      ),
      onTap: () {
//        print(DotEnv().env['Google_map_api']);    //debug
        FilmData newFilm = new FilmData(filmiso, inputtext, picsperfilm, "NA", filmsize);
        _addfilm(newFilm);
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {

                return HomeScreen( );
              },
            ),
          );
        });
      },
    );
  }


  void _addfilm(FilmData filmData) async{
    int result;
    result = await helper.insertFilm(filmData);
    print (result);
  }


}
