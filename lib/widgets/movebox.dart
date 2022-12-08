import 'package:flutter/material.dart';
import "dart:math";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/common/Constants.dart';
import 'package:pokemon_flame/common/types.dart';
import 'package:pokemon_flame/widgets/button/moveButton.dart';
import 'package:pokemon_flame/widgets/button/paralleButton.dart';

class MoveBox extends ConsumerStatefulWidget{

  MoveBox({
    Key? key,
    required this.devicewidth,
    required this.boxHeight
  }):super(
    key: key
  );

  final double devicewidth;
  final double boxHeight;

  @override 
  ConsumerState<MoveBox> createState() => MoveBoxState();
}

class MoveBoxState extends ConsumerState<MoveBox>{

  @override
  Widget build(context){
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                children: [
                  SizedBox(width: 3,),
                  SizedBox(width: widget.devicewidth * 0.39 * Constants.cornerWidth,),
                  MoveButton(
                    moveText: "スレイ", 
                    width: widget.devicewidth * 0.39, 
                    type: MonsterTypes.SUN
                  ),
                  MoveButton(
                    moveText: "スレイ", 
                    width: widget.devicewidth * 0.39, 
                    type: MonsterTypes.HUMAN
                  ),
                ],
              ),

            SizedBox(height: widget.devicewidth * 0.39 * 0.13,),

            Row(
                children: [
                  SizedBox(width: 3,),
                  MoveButton(
                    moveText: "スレイ", 
                    width: widget.devicewidth * 0.39, 
                    type: MonsterTypes.SUN
                  ),
                  MoveButton(
                    moveText: "スレイ", 
                    width: widget.devicewidth * 0.39, 
                    type: MonsterTypes.HUMAN
                  ),
                ],
              ),
            
            

        
          ],
        ),
        ),

        Align(
          alignment: Alignment(0.685, 0),
          child: Transform.rotate(
          alignment: Alignment.center,
          angle: 50/161,
          child: Container(
            height: MediaQuery.of(context).size.height ,
            width: 3,
            color: Colors.black,
          ),
        )
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(
              bottom: (widget.boxHeight - widget.devicewidth*0.52),
              right: 7
              ),
            child: ParalleButton(
              onTap: () {
                print("戻る");
              },
              text: "戻る", 
              fontSize: 16, 
              width: 70,
              )
          )
        )
      ],
    );
  }
}