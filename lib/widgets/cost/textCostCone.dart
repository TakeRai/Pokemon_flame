import 'package:flutter/material.dart';
import 'package:pokemon_flame/choice/choiceConfig.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class TextCostCone extends StatelessWidget{

  const TextCostCone({
    Key? key,
    required this.costText
  }) :super(key: key);

  final int costText;

  @override
  Widget build(context){

    return Container(
      width: Config_Choice.cardCostHeight,
      height: Config_Choice.cardCostHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/costCone_green.png"),
          fit: BoxFit.fill
        )
      ),
      child: Center(
        child: Text(
        (costText + 1).toString(),
        style: desigedStyle(26),
      ),
      ),
    );

  }
}