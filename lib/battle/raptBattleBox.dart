import 'package:flutter/material.dart';
import 'package:pokemon_flame/widgets/typedTextDelayed.dart';

class RaptBattleBox extends StatelessWidget{

  

  @override
  Widget build(context){
    return Center(child: TypedTextDelayed(text: "ここはRapt",duration: Duration(milliseconds: 50),));
  }
}