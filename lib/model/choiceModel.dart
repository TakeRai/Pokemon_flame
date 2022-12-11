import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flame/widgets/ripple/ripple.dart';


class ChoiceModel{
  ChoiceModel({
    required this.focusedIndex,required this.dragCost,
    required this.top_drag,required this.left_drag,
    required this.startAnimText,required this.isAbleGoBattle,
    required this.choicedMonsterCosts,
    required this.ripplelist
  });

  int focusedIndex;
  int dragCost;
  double top_drag;
  double left_drag;
  bool startAnimText;
  bool isAbleGoBattle;
  List<int> choicedMonsterCosts;
  List<Widget> ripplelist;

}