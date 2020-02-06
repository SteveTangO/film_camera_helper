import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:flutter/material.dart';

class ListPicker extends StatelessWidget{

  List<String> options;
  ListPicker({@required this.options, this.callback});
  void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: ListView.builder(
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index){;
          return GestureDetector(
            child: Container(
              color: kinformationboardcolor,
              height: 50,
              child: Center(
                child: Text("${options[index]}", style: kbodytextstyle,),
              ),
            ),
            onTap: (){
              callback(options[index]);
            },
          );
        },
        //separatorBuilder: (BuildContext context,int index) => Divider(),
      ),
    );
  }
}