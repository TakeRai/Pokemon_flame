import 'package:flutter/material.dart';
import 'package:pokemon_flame/common/types.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class TypeIcon extends StatelessWidget{

  TypeIcon({
    Key? key,
    required this.type,

  }):super(key: key);

  final MonsterTypes type;
  
  double width = 30;
  double height = 22;

  @override
  Widget build(context){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: typeColor(type),
        border: Border.all(color: Colors.black,width: 1),
        borderRadius: BorderRadius.circular(width/5)
      ),
      child: Center(
        child: Text(typeText(type),style: desigedStyle(12,letter: 2.2),),
      ),
    );
  }
}

Color typeColor(MonsterTypes type){
  switch(type){
    case MonsterTypes.GOD: return Color(0xFF7D00FF);
    case MonsterTypes.HUMAN: return Color(0xFFFFC5AB);
    case MonsterTypes.SUN: return Color(0xFFFF4F00);
    case MonsterTypes.EARTH: return Color(0xFF19FFE5);
    case MonsterTypes.MOON: return Color(0xFFFFFF00);
    default: return Color.fromARGB(255, 255, 255, 255);
  }
}

String typeText(MonsterTypes type){
  switch(type){
    case MonsterTypes.GOD: return "GOD";
    case MonsterTypes.HUMAN: return "HUM";
    case MonsterTypes.SUN: return "SUN";
    case MonsterTypes.EARTH: return "EAR";
    case MonsterTypes.MOON: return "MOO";
    default: return "";

  }
}