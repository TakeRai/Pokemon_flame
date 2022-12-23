import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flame/widgets/ripple/ripple.dart';


class ChoiceModel{
  ChoiceModel({
    required this.focusedIndex,
    required this.dragCost,
    required this.infoCost,
    required this.top_drag,required this.left_drag,
    required this.isAbleGoBattle,
    required this.choicedMonsterCosts,
    required this.ripplelist
  });

  int focusedIndex;
  int dragCost;
  int infoCost;
  double top_drag;
  double left_drag;
  bool isAbleGoBattle;
  List<int> choicedMonsterCosts;
  List<Widget> ripplelist;

}