import 'package:flutter/material.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class HPText extends StatelessWidget{

  const HPText({
    Key? key,
    required this.maxHP,
    required this.remainHP,
    required this.fontsize
  }):
  super(key: key);

  final int maxHP;
  final int remainHP;
  final double fontsize;

  @override
  Widget build(context){
    return Row(
      children: [
        Text(remainHP.ceil().toString(),style: desigedStyle(fontsize),),
        Text("/",style: desigedStyle(fontsize),),
        Text(maxHP.ceil().toString(),style: desigedStyle(fontsize),),
      ],
    );
  }
}