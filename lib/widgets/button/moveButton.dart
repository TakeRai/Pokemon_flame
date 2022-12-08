import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/common/Constants.dart';
import 'package:pokemon_flame/common/types.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class MoveButtonUI extends ConsumerStatefulWidget{

  const MoveButtonUI({
    Key? key,
    required this.moveText,
    required this.width,
    required this.type
  }):super(key: key);

  final String moveText;
  final double width;
  final MonsterTypes type;

  @override
  ConsumerState<MoveButtonUI> createState() => MoveButtonUIState();
}

class MoveButtonUIState extends ConsumerState<MoveButtonUI>{

  @override
  Widget build(context){
    final typeButton = movePng(widget.type);

    return Container(
      width: widget.width,
      height: widget.width * 0.49,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/button/$typeButton"),
          fit: BoxFit.fill
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: widget.width * 0.49 *0.5,
            padding: EdgeInsets.only(left: widget.width * Constants.cornerWidth),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.moveText,
                  style: desigedStyle(18),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String movePng(MonsterTypes type){
    switch(type){
      case MonsterTypes.GOD:
        return "godButton.png";
      case MonsterTypes.SUN:
        return "sunButton.png";
      
      default:
        return "noneButton.png";
    }
  }
}

class MoveButton extends ConsumerStatefulWidget{

  const MoveButton({
    Key? key,
    required this.moveText,
    required this.width,
    required this.type
  }):super(key: key);

  final String moveText;
  final double width;
  final MonsterTypes type;

  @override
  ConsumerState<MoveButton> createState() => MoveButtonState();

}

class MoveButtonState extends ConsumerState<MoveButton>{

  @override
  Widget build(context){
    return GestureDetector(
      onTap: (){print("ok");},
      child: MoveButtonUI(
        moveText: widget.moveText, 
        width: widget.width, 
        type: widget.type
        ),
    );
  }
}