import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:flutter/material.dart';

class ListPicker extends StatelessWidget{

  List<double> options;
  ListPicker({@required this.options,this.intValue, this.callback});
  final bool intValue; // specifies if value shown should be int
  void Function(double) callback;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (BuildContext context, int index){
        var option = intValue? options[index].toInt():options[index];
        return GestureDetector(
          child: Container(
            color: kinformationboardcolor,
            height: 50,
            child: Center(
              child: Text("$option", style: kbodytextstyle,),
            ),
          ),
          onTap: (){
            callback(options[index]);
          },
        );
      },
      //separatorBuilder: (BuildContext context,int index) => Divider(),
    );
  }
}