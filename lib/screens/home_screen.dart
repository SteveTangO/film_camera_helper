import 'package:film_camera_campanion/screens/setting_screen.dart';
import 'package:film_camera_campanion/utilities/PictureData.dart';
import 'package:flutter/material.dart';
import 'package:film_camera_campanion/services/locations.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:geolocator/geolocator.dart'; //location service package
//authorisation functions in both systems are implemented
import 'package:film_camera_campanion/utilities/filmstock.dart';
import 'package:film_camera_campanion/screens/new_film_screen.dart';
import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/widgets/information_board.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {

  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Position position = Position(longitude: 0,latitude: 0);
  AnimationController controller;
  Animation animation;
  bool selected = false;
  ItemScrollController _scrollController = ItemScrollController();
  int scrollIndex = 0;
  List<PictureData> filmroll = new List(42); //list of picture data for this film
  InformationBoard _informationBoard = InformationBoard();
  bool shrink = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    controller.forward(from: 0.3);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    animation.addStatusListener((status) {
      print(status);
    });
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //TODO: improve the user guide
  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: Text("Alert"),
        content: Text('You haven\'t permit location service'),
      ),
    );
  }

  // function called when 'add' is pressed
  void add() {
    setState(() {
      if (scrollIndex < 41) scrollIndex++;
      _scrollController.scrollTo(
          index: scrollIndex, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background.PNG')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AnimatedContainer(
              height: shrink? 0 : MediaQuery.of(context).size.height/20,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
                child: SizedBox(
                  height: 100,
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  child: _informationBoard
                ),
                onTap: (){
                  setState(() {
                    shrink = !shrink;
                    _informationBoard.toggleSelected();
                  });
                },
              ),
              flex: 15,
            ),
            //add the horizontal ListView widget
            AnimatedContainer(
              height: shrink? 0 : MediaQuery.of(context).size.height/5,
              duration: Duration(milliseconds: 500),
              child: ScrollablePositionedList.separated(
                itemScrollController: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 42,
                itemBuilder: (BuildContext context, int index) {
                  int filmcardserial = index + 1;
                  return Container(
                    height: 100 * animation.value,
                    width: 180 * animation.value,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(20),
                    child: Center(child: Text("$filmcardserial")),
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
            AnimatedContainer(
              height: shrink? 0 : MediaQuery.of(context).size.height/30,
              duration: Duration(milliseconds: 500),
            ),
            AnimatedContainer(
              height: shrink? 0 : MediaQuery.of(context).size.height/20,
              duration: Duration(milliseconds: 500),
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
            AnimatedContainer(
              height: shrink? 0 : MediaQuery.of(context).size.height/30,
              duration: Duration(milliseconds: 500),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            filmroll[scrollIndex] = PictureData(filmstockserial: scrollIndex);
            print('this is the NO${scrollIndex + 1} film');
            Location location = Location(); //construct a location object
            await location
                .getLocation(); //utilise the getlocation function from Location class
            //todo: associate the location with other information
            position = location.position;
            print(position);
            setState(() {
              _informationBoard.setPosition(position);
            });
            add();
          } catch (e) {
            print('fail to acquire location');
            displayDialog();
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
