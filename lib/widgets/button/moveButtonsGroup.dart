import 'package:flutter/material.dart';
import 'package:pokemon_flame/common/constants.dart';
import 'package:pokemon_flame/common/types.dart';
import 'package:pokemon_flame/widgets/button/moveButton.dart';

class MoveButtonsGroup extends StatelessWidget{

  MoveButtonsGroup({
    Key? key,
    required this.dialogHeight,
    required this.isShadow,
    required this.moveButtonWidth,
    required this.moveTextList,
    required this.moveTypeList
  }):super(key: key);

  final double dialogHeight;
  final bool isShadow;
  final double moveButtonWidth;
  final List<String> moveTextList;
  final List<MonsterTypes> moveTypeList;

  double shadowTop = 10;
  double shadowLeft = 3;

  @override
  Widget build(context){


    double topmargin = isShadow ? shadowTop : 0;
    double leftmargin = isShadow? shadowLeft :0;

    return Container(
      // margin: EdgeInsets.only(top: topmargin,left: leftmargin),
      height: dialogHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              children: [
                SizedBox(width: 3,),
                SizedBox(width: moveButtonWidth * 0.13 /2,),
                SizedBox(width: moveButtonWidth * Constants.cornerWidth,),
                moveButtonBranch(isShadow: isShadow, moveText: moveTextList[0], width: moveButtonWidth, type: moveTypeList[0]),
                moveButtonBranch(isShadow: isShadow, moveText: moveTextList[1], width: moveButtonWidth, type: moveTypeList[1])
              ],
            ),

          SizedBox(height: moveButtonWidth * 0.13,),

          Row(
              children: [
                SizedBox(width: 3,),
                SizedBox(width: moveButtonWidth * 0.13 / 2,),
                moveButtonBranch(isShadow: isShadow, moveText: moveTextList[2], width: moveButtonWidth, type: moveTypeList[2]),
                moveButtonBranch(isShadow: isShadow, moveText: moveTextList[3], width: moveButtonWidth, type: moveTypeList[3])
              ],
            ),
        ],
      ),
    );
  }

  Widget moveButtonBranch({
    required bool isShadow,
    required String moveText,
    required double width,
    required MonsterTypes type
    }){
    return isShadow ? 
      Container(
        width: width,height: width * 0.49,
        margin: EdgeInsets.only(
          top: shadowTop/2,
          left: shadowLeft/2
        ),
        child: Image.asset(
          "assets/images/button/sunButton.png",
          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
          ),
      ) :
      MoveButton(
        moveText: moveText, 
        width: width, 
        type: type,
        pressedLeft: shadowLeft,
        pressedTop: shadowTop,
        );
  }
}