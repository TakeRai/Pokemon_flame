import 'package:flutter/material.dart';

class HPBar extends StatelessWidget{

  const HPBar({
    Key? key,
    required this.height,
    required this.width,
    required this.maxHP,
    required this.remainHP
  }):super(key: key);

  final double width;
  final double height;
  final int maxHP;
  final int remainHP;


  @override
  Widget build(context){
    double heartMagni = 1.6;
    double barMargin = (heartMagni - 1) /2 ;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left:width*0.03 ,top: height * barMargin),
          width: width * 0.98,
          height: height,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: width*0.07,),
              Container(
                width: width * 0.9 *(remainHP / maxHP),
                height: height * 0.8,
                color: Colors.green,

              )
            ],
          )
        ),
        SizedBox(
            width:  height * 1.6,
            height: height * 1.6,
            child: Image.asset(
              "assets/images/mental.png"
              ),
          ),
      ],
    );
  }
}