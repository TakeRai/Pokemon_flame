import 'package:flutter/material.dart';
import 'package:pokemon_flame/model/choiceModel.dart';
import 'package:pokemon_flame/widgets/ripple/ripple.dart';

void cardRippleStart_F ({
  required ChoiceModel mo,
  required List<GlobalKey> keylist,
  required double safeAreaTop
}){
  for(var i=0;i<3;i++){
    if(mo.choicedMonsterCosts[i] == -1){
      RenderBox box = keylist[i].currentContext?.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(
        Offset(
          box.size.width/2,
          box.size.height/2 - safeAreaTop,
          ));
      
      mo.ripplelist[i] = Ripple(offset: position, duration: const Duration(milliseconds: 500));
    }else{
      mo.ripplelist[i] = const SizedBox();
    }
    
  }
}