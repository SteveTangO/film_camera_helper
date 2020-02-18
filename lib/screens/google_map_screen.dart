import 'dart:async';
import 'package:film_camera_campanion/services/locations.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:film_camera_campanion/utilities/size_config.dart';

class GoogleMapScreen extends StatefulWidget{

  // fields
  Position position;

  GoogleMapScreen({this.position});

  @override
  State<StatefulWidget> createState() => _GoogleMapScreenState(position: position);
}

class _GoogleMapScreenState extends State<GoogleMapScreen>{

  Position position;
  LatLng latLng;
  LatLng original;
  String address;

  _GoogleMapScreenState({this.position});

  Completer<GoogleMapController> _mapController = Completer();

  void _getAddress(LatLng latLng)async{
    String ad = await Location.getAddress(latLng);
    setState(() {
      address = ad;
    });
  }

  void animateTo(LatLng latLng) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: latLng,
            zoom: 13
        )
    ));
  }

  @override
  void initState(){
    super.initState();
    latLng = LatLng(position.latitude,position.longitude);
    original = latLng;
    _getAddress(latLng);
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: SizeConfig.safeBlockHorizontal*3),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: SizeConfig.safeBlockVertical*25,
                child: Center(
                  child: Text("$address",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical*3,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.safeBlockVertical*50,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: latLng,
                    zoom: 13
                  ),
                  onMapCreated: (GoogleMapController controller){
                    _mapController.complete(controller);
                  },
                  markers: Set<Marker>.of([
                    Marker(
                      position: latLng,
                      markerId: MarkerId("Current Position"),
                      infoWindow: InfoWindow(title: "Current Position"),
                      draggable: true,
                      onDragEnd: (LatLng ll){
                        setState(() {
                          latLng = ll;
                          _getAddress(latLng);
                        });
                        animateTo(latLng);
                      }
                    )
                  ]),
                ),
              ),
              Container(
                height: SizeConfig.safeBlockVertical*25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Ink(
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.lightBlue
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.undo),
                        onPressed: (){
                          setState(() {
                            latLng = original;
                            _getAddress(latLng);
                          });
                          animateTo(latLng);
                        },
                      ),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.lightBlue
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.check),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),

                  ],
                  )
                ),
              ]
          )
        ),
      ),
    );
  }
}

