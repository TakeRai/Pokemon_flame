import 'package:flutter/material.dart';
import 'package:pokemon_flame/model/choiceModel.dart';

void cardLongPressEnd_F ({
  required ChoiceModel mo,
  required LongPressEndDetails details,
  required List<GlobalKey> keylist,
  required double boxHeight
}){

    for(var i=0; i<3; i++){
      mo.ripplelist[i] = const SizedBox();
    }

    bool vertical = false;
    int horizontal = -1;

    List<Offset> boxPositions = [Offset(0, 0),Offset(0, 0),Offset(0, 0)];

    for(var i=0; i<3; i++){
      RenderBox box = keylist[i].currentContext?.findRenderObject() as RenderBox;
      boxPositions[i] = box.localToGlobal(Offset(box.size.width/2,-10));

      if(boxPositions[0].dy < details.globalPosition.dy && details.globalPosition.dy < boxPositions[0].dy + boxHeight){
        vertical = true;
      }
      if(boxPositions[i].dx - boxHeight/2 < details.globalPosition.dx && details.globalPosition.dx < boxPositions[i].dx + boxHeight/2){
        horizontal = i;
      }
    }

    

    if(vertical && horizontal != -1 && 
       costCheck(
        choicedMonsterCosts: mo.choicedMonsterCosts, 
        dragCost: mo.dragCost,
        horizontal: horizontal
        )){
      mo.choicedMonsterCosts[horizontal] = mo.dragCost;
    }


    mo.dragCost = -1;

    if(mo.choicedMonsterCosts.every((element) => element != -1)){
      mo.isAbleGoBattle = true;
    }

}

bool costCheck({
  required List<int> choicedMonsterCosts,
  required int dragCost,
  required int horizontal
}){

  int usableCost = 15 - (choicedMonsterCosts.reduce((a, b) => a+b) + 3);
  usableCost += (choicedMonsterCosts[horizontal] + 1);

  int check = usableCost - (dragCost + 1);

  return check >= 0 ? true : false;
}