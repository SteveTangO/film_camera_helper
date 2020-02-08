import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/utilities/size_config.dart';
import 'package:flutter/material.dart';

class ListPicker extends StatefulWidget{

  List<String> options; // list of options to show
  void Function(String) callback; // callback when chosen value changes
  double itemHeight; // height of each item in list
  bool horizontalLine; // if true, renders a horizontal line on each side

  // constructor
  ListPicker({
    @required this.options,
    this.callback,
    this.itemHeight,
    this.horizontalLine
  });

  @override
  _ListPickerState createState()=> _ListPickerState();
}

class _ListPickerState extends State<ListPicker>{

  List<String> options;
  void Function(String) callback;
  int selected = 0;
  double itemHeight;
  bool horizontalLine;

  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {

    // initialize SizeConfig
    SizeConfig().init(context);

    // get values from parent widget
    options = widget.options;
    callback = widget.callback;
    itemHeight = widget.itemHeight;
    horizontalLine = widget.horizontalLine;

    itemHeight = itemHeight == null? SizeConfig.safeBlockVertical * 7 : itemHeight;
    horizontalLine = horizontalLine == null? true:horizontalLine;

    // define textstyles
    TextStyle defaultTextStyle = TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600);
    TextStyle selectedTextStyle = TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600);

    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // left horizontal line
        horizontalLine? HorizontalLine(itemHeight: itemHeight,):SizedBox(height: 0,),
        // list picker
        Container(
            width: SizeConfig.blockSizeHorizontal*28,
            //color: Colors.green,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification){
                    if (selected != (scrollController.offset / itemHeight).round()){
                      setState(() {
                        selected = (scrollController.offset / itemHeight).round();
                      });
                    }
                    try{ // in case selected goes negative during scrolling
                      callback(options[selected]);
                    }catch(e){}
                    //print(selected);
                  }
                  return true;
                },
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: options.length + 10,
                    controller: scrollController,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: itemHeight,
                        //color: Colors.blue,
                        child: Center(
                          child:
                          Text("${index < options.length? options[index]:"--"}",
                            style: index == selected? selectedTextStyle:defaultTextStyle,
                          ),
                        ),
                      );
                    }
                ),
              ),
        ),
        // right horizontal line
        horizontalLine? HorizontalLine(itemHeight: itemHeight,):SizedBox(height: 0,),
      ],
    );
  }

}

class HorizontalLine extends StatelessWidget{

  double itemHeight;
  HorizontalLine({@required this.itemHeight});

  @override
  Widget build(BuildContext context) {
    double lineThickness = itemHeight/12;
    //print(itemHeight);
    return Container(
      height: itemHeight,
      width: SizeConfig.safeBlockHorizontal * 5,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          Container(
            height: (itemHeight-lineThickness)/2,
          ),
          Container(
            //width: SizeConfig.safeBlockHorizontal * 5,
            height: lineThickness,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}