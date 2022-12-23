import 'package:flutter/material.dart';
import 'package:pokemon_flame/choice/choiceConfig.dart';
import 'package:pokemon_flame/widgets/cost/textCostCone.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class BaseCard extends StatelessWidget{
  const BaseCard({
    Key? key,
    required this.costIndex,
    required this.width,
    required this.fontSize
    }):super(key: key);

  final int costIndex;
  final double width;
  final double fontSize;

  @override
  Widget build(context){
    return Stack(
        children: [
          

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              width: width * 0.9,height: width * 0.9,
              child: Image.asset(
                // "assets/images/amon-face.jpg",
                // fit: BoxFit.fill,
                // "assets/images/fenrir-face.jpg",
                "assets/images/fenrir_back.jpeg",
                fit: BoxFit.fitHeight,
                ),
            )
          ),

          SizedBox(
            width: width,
            height: width * Config_Choice.cardHeightMagni,

            child: Image.asset("assets/images/redcard.png",fit: BoxFit.fill,),
          ),

          Align(
            alignment:Alignment.topCenter,
            child: SizedBox(
              height: width * 0.325,
              child: Center(
                child: Text(
                  "アモン",
                  style: desigedStyle(fontSize)
                  ),
                
              )
              
            ),
          ),

          Positioned(
            top: 0,
            left: -Config_Choice.cardCostHeight/10,
            child: TextCostCone(costText: costIndex,)
            )

        ],
      );
  }



}

