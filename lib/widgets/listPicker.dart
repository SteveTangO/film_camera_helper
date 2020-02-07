import 'package:film_camera_campanion/utilities/constants.dart';
import 'package:film_camera_campanion/utilities/size_config.dart';
import 'package:flutter/material.dart';

class ListPicker extends StatelessWidget{

  List<String> options;
  ListPicker({@required this.options,this.callback});
  void Function(String) callback;

  ScrollController scrollController = ScrollController();
  int selected = 0;
  double itemHeight;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextStyle defaultTextStyle = TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600);
    TextStyle selectedTextStyle = kbodytextstyle;
    itemHeight = SizeConfig.safeBlockVertical * 7;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LineColumn(itemHeight: itemHeight,),
        Container(
            width: SizeConfig.blockSizeHorizontal*28,
            //color: Colors.green,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification){
                    selected = (scrollController.offset / itemHeight).round();
                    try{ // in case selected goes negative during scrolling
                      callback(options[selected]);
                    }catch(e){}
                    //print(selected);
                  }
                  /*if (scrollNotification is ScrollEndNotification){
                    scrollController.animateTo(selected*itemHeight,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                   */
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
                            style: kbodytextstyle,
                          ),
                        ),
                      );
                    }
                ),
              ),
        ),
        LineColumn(itemHeight: itemHeight,),
      ],
    );
  }

}


class LineColumn extends StatelessWidget{

  double itemHeight;
  LineColumn({@required this.itemHeight});

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