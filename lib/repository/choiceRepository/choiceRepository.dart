import 'dart:ffi';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_flame/repository/choiceRepository/cardLongPressEnd.dart';
import 'package:pokemon_flame/repository/choiceRepository/cardRippleStart.dart';
import 'package:pokemon_flame/widgets/ripple/ripple.dart';
import 'package:pokemon_flame/model/choiceModel.dart';

class ChoiceRepository extends ChangeNotifier{

  ChoiceModel mo = ChoiceModel(
    focusedIndex: 0, 
    dragCost: -1,
    top_drag: 0, left_drag: 0, 
    startAnimText: false, isAbleGoBattle:false,
    choicedMonsterCosts: [-1,-1,-1], 
    ripplelist: <Widget>[const SizedBox(),const SizedBox(),const SizedBox(),]
    );

  void focusedIndexChange(int index){
    mo.focusedIndex = index;
    notifyListeners();
  }

  void startDelayedText(){
    mo.startAnimText = true;
    notifyListeners();
  }


  void cardRippleStart(List<GlobalKey> keylist, double safeAreaTop){
    cardRippleStart_F(
      mo: mo, 
      keylist: keylist, 
      safeAreaTop: safeAreaTop
      );
    notifyListeners();
  }

  void dragpositionChange({
    required LongPressMoveUpdateDetails details,
    required double dragCardWidth
    }){
    mo.top_drag = details.globalPosition.dy - dragCardWidth * 1.03 /2;
    mo.left_drag = details.globalPosition.dx - dragCardWidth * 1.03 /2;

    notifyListeners();
  }

  void cardLongPressStart({
    required LongPressStartDetails details,
    required int cardIndex,
    required double dragCardWidth,
    }){
    mo.dragCost = cardIndex;
    mo.top_drag = details.globalPosition.dy - dragCardWidth * 1.03 /2;
    mo.left_drag = details.globalPosition.dx - dragCardWidth * 1.03 /2;

    notifyListeners();
  }

  void cardLongPressEnd(
    {
      required LongPressEndDetails details,
      required List<GlobalKey> keylist,
      required double boxHeight,
    }
    ){
    cardLongPressEnd_F(mo: mo, details: details, keylist: keylist,boxHeight: boxHeight);
    print(mo.choicedMonsterCosts);
    notifyListeners();
  }

  // void partyInsetsBoolChange(int index,bool bool){
  //   mo.partyZoneInsetsBools[index] = bool;
  //   notifyListeners();
  // }

  void partyZoneDragStart({
    required int partyZoneIndex,
    required LongPressStartDetails details,
    required double dragCardWidth,
  }){
    mo.dragCost = mo.choicedMonsterCosts[partyZoneIndex];
    mo.top_drag = details.globalPosition.dy - dragCardWidth * 1.03 /2;
    mo.left_drag = details.globalPosition.dx - dragCardWidth * 1.03 /2;

    notifyListeners();
  }

  void partyZoneDragEnd({
    required LongPressEndDetails details,
    required List<GlobalKey> keylist,
    required int partyZoneIndex,
    required double boxHeight,
  }){

    bool vertical = false;
    int horizontal = -1;

    List<Offset> boxPositions = [Offset(0, 0),Offset(0, 0),Offset(0, 0)];

    for(var i=0; i<3; i++){

      RenderBox box = keylist[i].currentContext?.findRenderObject() as RenderBox;
      boxPositions[i] = box.localToGlobal(Offset(box.size.width/2,-10));

      if(boxPositions[0].dy  < details.globalPosition.dy && details.globalPosition.dy < boxPositions[0].dy + boxHeight){
        vertical = true;
      }
      if(boxPositions[i].dx - boxHeight/2 < details.globalPosition.dx && details.globalPosition.dx < boxPositions[i].dx + boxHeight/2){
        horizontal = i;
      }
    }

    if(vertical && horizontal != -1){
      mo.choicedMonsterCosts[partyZoneIndex] = mo.choicedMonsterCosts[horizontal];
      mo.choicedMonsterCosts[horizontal] = mo.dragCost;
    }else{
      mo.choicedMonsterCosts[partyZoneIndex] = -1;
    }

    mo.dragCost = -1;

    print(mo.choicedMonsterCosts);


    notifyListeners();
  }
}

