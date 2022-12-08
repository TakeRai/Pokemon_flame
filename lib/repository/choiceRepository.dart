import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_flame/widgets/ripple/ripple.dart';
import 'package:pokemon_flame/model/choiceModel.dart';

class ChoiceRepository extends ChangeNotifier{

  ChoiceModel mo = ChoiceModel(
    focusedIndex: 0, 
    top_drag: 0, left_drag: 0, 
    visible: false, startAnimText: false, isAbleGoBattle:false,
    choicedMonsterCosts: [-1,-1,-1], 
    rippleBools: [false,false,false], 
    partyBools: [false,false,false], partyZoneInsetsBools: [false,false,false],
    cardChoicedBools: [
      for(var i=0; i<10; i++)...[
        false
      ]
    ],
    costOpacityList: [
      for(var i=0; i<15; i++)...[
        1
      ]
    ], 
    cardOpacityList: [
      for(var i=0; i<10; i++)...[
        1
      ]
    ], 
    ripplelist: <Ripple>[]
    );

  void focusedIndexChange(int index){
    mo.focusedIndex = index;
    notifyListeners();
  }

  void dragCardVisibleChange(bool bool){
    mo.visible = bool;
    notifyListeners();
  }


  void partyBoolChange(int index,bool bool){
    mo.partyBools[index] = bool;
    notifyListeners();
  }

  void cardChiocedChange(int index,bool bool){
    mo.cardChoicedBools[index] = bool;
    notifyListeners();
  }

  void costOpaChangeRand(){
    int random = Random().nextInt(15);
    mo.costOpacityList[random] = 0.3;
    notifyListeners();
  }

  void startDelayedText(){
    mo.startAnimText = true;
    notifyListeners();
  }

  void cardOpaChange(int index,double cardOpacity){
    mo.cardOpacityList[index] = cardOpacity;
    notifyListeners();
  }

  void cardRippleStart(List<GlobalKey> keylist, double safeAreaTop){
    for(var i=0;i<3;i++){
      RenderBox box = keylist[i].currentContext?.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(
        Offset(
          box.size.width/2,
          box.size.height/2 - safeAreaTop,
          ));
      
      mo.ripplelist.add(Ripple(offset: position, duration: const Duration(milliseconds: 500)));
    }
    notifyListeners();
  }

  void dragpositionChange({
    required LongPressMoveUpdateDetails details,
    required double dragCardWidth
    }){
    // mo.top_drag = details.globalPosition.dy - 103;
    // mo.left_drag = details.globalPosition.dx - 51.5;
    mo.top_drag = details.globalPosition.dy 
      - dragCardWidth 
      * 1.03 /2;

    mo.left_drag = details.globalPosition.dx - dragCardWidth * 1.03 /2;

    notifyListeners();
  }

  void cardLongPressStart({
    required LongPressStartDetails details,
    required List<GlobalKey> keylist,
    required int index,
    required double dragCardWidth,
    }){
    mo.visible = true;
    mo.top_drag = details.globalPosition.dy - dragCardWidth * 1.03 /2;
    mo.left_drag = details.globalPosition.dx - dragCardWidth * 1.03 /2;
    mo.rippleBools.forEach((element) {
      element = true;
    });
    notifyListeners();
  }

  void cardLongPressEnd(LongPressEndDetails details,List<GlobalKey> keylist,int index){
    mo.visible = false;
    mo.rippleBools.forEach((element) {
      element = false;
    });
    mo.ripplelist.clear();

    bool vertical = false;
    int horizontal = -1;

    ///よく考えたら、ifのところの数字変えんといかんやん
    
    List<Offset> boxPositions = [Offset(0, 0),Offset(0, 0),Offset(0, 0)];

    for(var i=0; i<3; i++){
      RenderBox box = keylist[i].currentContext?.findRenderObject() as RenderBox;
      boxPositions[i] = box.localToGlobal(Offset(box.size.width/2,-10));

      if(boxPositions[0].dy + 5 < details.globalPosition.dy && details.globalPosition.dy < boxPositions[0].dy + 95){
        vertical = true;
      }
      if(boxPositions[i].dx - 45 < details.globalPosition.dx && details.globalPosition.dx < boxPositions[i].dx + 45){
        horizontal = i;
      }
    }


    if(vertical && horizontal != -1){
      mo.partyBools[horizontal] = true;
      partyInsetsBoolChange(horizontal, true);
      mo.cardChoicedBools[mo.focusedIndex] = true;
    }
    else{
      mo.cardOpacityList[index] = 1.0;
    }

    //パーティーが3体揃っていればの処理
    if(mo.partyBools.every((element) => element == true)){
      mo.isAbleGoBattle = true;
    }

    notifyListeners();
  }

  void partyInsetsBoolChange(int index,bool bool){
    mo.partyZoneInsetsBools[index] = bool;
    notifyListeners();
  }
}