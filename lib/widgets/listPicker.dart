import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/utilities/size_config.dart';
import 'package:flutter/material.dart';

class ListPicker extends StatefulWidget{

  // general fields
  List<String> options; // list of options to show
  void Function(String) callback; // callback when chosen value changes
  Axis scrollDirection;
  TextStyle defaultStyle;
  TextStyle selectedStyle;
  bool horizontalLine;

  // vertical list specific fields
  double itemHeight; // height of each item in list

  // horizontal list specific fields
  double itemWidth;

  // constructor
  ListPicker({
    @required this.options,
    this.callback,
    this.scrollDirection,
    this.defaultStyle,
    this.selectedStyle,
    this.horizontalLine,
    this.itemHeight,
    this.itemWidth
  });

  @override
  _ListPickerState createState()=> _ListPickerState();
}

class _ListPickerState extends State<ListPicker>{

  int selected = 0;

  List<String> options;
  void Function(String) callback;
  Axis scrollDirection;
  TextStyle defaultStyle;
  TextStyle selectedStyle;
  bool horizontalLine;

  double itemHeight;

  double itemWidth;

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    // initialize SizeConfig
    SizeConfig().init(context);

    // get values from parent widget
    options = widget.options;
    callback = widget.callback;
    scrollDirection = widget.scrollDirection == null? Axis.vertical: widget.scrollDirection;
    defaultStyle = widget.defaultStyle == null?
      TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600):widget.defaultStyle;
    selectedStyle = widget.selectedStyle == null?
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600):widget.selectedStyle;
    itemHeight = widget.itemHeight == null?
        SizeConfig.safeBlockVertical*7: widget.itemHeight;
    itemWidth = widget.itemWidth == null?
        SizeConfig.safeBlockHorizontal*14: widget.itemWidth;
    horizontalLine = widget.horizontalLine;
    if (horizontalLine == null){horizontalLine = true;}

    return Container(
      width: itemWidth*2,
        //color: Colors.blue,
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification){
              if (scrollDirection == Axis.vertical) {
                if (selected != (scrollController.offset / itemHeight).round()){
                  setState(() {
                    selected = (scrollController.offset / itemHeight).round();
                  });
                }
              }
              else if (scrollDirection == Axis.horizontal){
                if (selected != (scrollController.offset / itemWidth).round()){
                  setState(() {
                    selected = (scrollController.offset / itemWidth).round();
                  });
                }
              }
              try{ // in case selected goes negative during scrolling
                callback(options[selected]);
              }catch(e){}
              //print(selected);
            }
            return true;
          },
          child: ListView.builder(
              reverse: scrollDirection == Axis.horizontal? true: false,
              scrollDirection: scrollDirection,
              padding: const EdgeInsets.all(0),
              itemCount: options.length + 4,
              controller: scrollController,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: itemHeight,
                  width: itemWidth,
                  //color: Colors.blue,
                  child: Center(
                    child:
                    Text("${index < options.length? options[index]:"--"}",
                      style: index == selected? selectedStyle:defaultStyle,
                    ),
                  ),
                );
              }
          ),
        ),
    );
  }

}


class HorizontalLine extends StatelessWidget{

  double itemHeight;
  HorizontalLine({this.itemHeight});

  @override
  Widget build(BuildContext context) {
    if (itemHeight == null){
      itemHeight = SizeConfig.safeBlockVertical*7;
    }
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
