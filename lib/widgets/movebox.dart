import 'package:flutter/material.dart';
import "dart:math";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/common/Constants.dart';
import 'package:pokemon_flame/common/types.dart';
import 'package:pokemon_flame/widgets/button/moveButton.dart';
import 'package:pokemon_flame/widgets/button/moveButtonsGroup.dart';
import 'package:pokemon_flame/widgets/button/paralleButton.dart';

class MoveBox extends ConsumerStatefulWidget{

  const MoveBox({
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
    final prov = ref.watch(battleProvider);
    double moveButtonWidth = widget.devicewidth * 0.355;
    //最右の空間
    final num1 = widget.devicewidth - 
    (3 + moveButtonWidth * 0.13 /2 + moveButtonWidth * Constants.cornerWidth + moveButtonWidth * 2);
    final num2 = widget.devicewidth/2 - num1;
    final double magni = num2/(widget.devicewidth/2);
    

    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: MoveButtonsGroup(
            dialogHeight: widget.boxHeight, 
            isShadow: true, 
            moveButtonWidth: moveButtonWidth, 
            moveTextList: ["","","",""], 
            moveTypeList: [MonsterTypes.NONE,MonsterTypes.NONE,MonsterTypes.NONE,MonsterTypes.NONE,]
            ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: MoveButtonsGroup(
            dialogHeight: widget.boxHeight, 
            isShadow: false, 
            moveButtonWidth: moveButtonWidth, 
            moveTextList: ["ファイア","スレイ","スレイ","バイオ"], 
            moveTypeList: [MonsterTypes.GOD,MonsterTypes.EARTH,MonsterTypes.MOON,MonsterTypes.HUMAN]
            ),
        ),

        Align(
          alignment: Alignment(magni, 0),
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

        Positioned(
          left: widget.devicewidth - num1 -3 - 5,
          bottom: 3,
          child: Container(
            margin: EdgeInsets.only(
              bottom: (widget.boxHeight - (moveButtonWidth)) /3,
              ),
            child: ParalleButton(
              onTap: () {
                print("onTap");
                // prov.choiceMove(false);
                prov.PageIndexChange(0);
              },
              
              text: "戻る", 
              fontSize: 16, 
              width: widget.devicewidth * 0.2,
              )
          )
        ),
        
      ],
    );
  }
}