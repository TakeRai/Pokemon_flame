import 'package:flutter/material.dart';
import 'package:pokemon_flame/common/ailments.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class AilmentIcon extends StatelessWidget{

  const AilmentIcon({
    Key? key,
    required this.width,
    required this.height,
    required this.leftmargin
  }):super(key: key);

  final double width;
  final double height;
  final double leftmargin;

  @override
  Widget build(context){
    Ailments ailment = Ailments.ferocity;
    return  Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: leftmargin),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ailmentColor(ailment),
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text(ailmentText(ailment),style: desigedStyle(12),),
    );
  }
}

Color ailmentColor(Ailments ailment){
  switch(ailment){
    case Ailments.lazy: return Color(0xFFFFC5AB);
    case Ailments.burst: return Color(0xFFFF4F00);
    case Ailments.ferocity: return Color(0xFF19FFE5);
    case Ailments.cursed: return Color(0xFFFFFF00);
    default : return Colors.white;
  }
}

String ailmentText(Ailments ailment){
  switch(ailment){
    case Ailments.lazy: return "なまけ";
    case Ailments.burst: return "炎上";
    case Ailments.ferocity: return "凶暴";
    case Ailments.cursed: return "呪い";
    default : return "";
  }
}