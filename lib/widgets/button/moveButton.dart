import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/common/Constants.dart';
import 'package:pokemon_flame/common/types.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class MoveButtonUI extends ConsumerStatefulWidget{

  const MoveButtonUI({
    Key? key,
    required this.moveText,
    required this.width,
    required this.type,
    required this.pressed,
    required this.pressedTop,
    required this.pressedLeft
  }):super(key: key);

  final bool pressed;
  final String moveText;
  final double width;
  final MonsterTypes type;
  final double pressedTop;
  final double pressedLeft;

  @override
  ConsumerState<MoveButtonUI> createState() => MoveButtonUIState();
}

class MoveButtonUIState extends ConsumerState<MoveButtonUI>{

  @override
  Widget build(context){
    final typeButton = movePng(widget.type);
    final pressed = widget.pressed;
    
    return Container(
      width: widget.width,
      height: widget.width * 0.49,
      margin: EdgeInsets.only(
        left: pressed ? widget.pressedLeft/2 : 0, 
        top: pressed ? widget.pressedTop/2 : 0,
        right: pressed ? 0 : widget.pressedLeft/2,
        bottom: pressed ? 0 : widget.pressedTop/2
        ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/button/$typeButton"),
          fit: BoxFit.fill,
          colorFilter: pressed ? ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.srcATop) : null
          ),
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


}

class MoveButton extends ConsumerStatefulWidget{

  const MoveButton({
    Key? key,
    required this.moveText,
    required this.width,
    required this.type,
    required this.pressedTop,
    required this.pressedLeft
  }):super(key: key);

  final String moveText;
  final double width;
  final MonsterTypes type;
  final double pressedTop;
  final double pressedLeft;

  @override
  ConsumerState<MoveButton> createState() => MoveButtonState();
}

class MoveButtonState extends ConsumerState<MoveButton>{

  bool pressed = false;

  @override
  Widget build(context){
    final battleProv = ref.watch(battleProvider);

    return GestureDetector(
      onTap: (){
        battleProv.SetHPSmooth();
        },
      onTapDown: (details) {
        setState(() {
          pressed =true;
        });
      },

      onTapCancel: () {
        setState(() {
          pressed = false;
        });
      },

      child: MoveButtonUI(
        moveText: widget.moveText, 
        width: widget.width, 
        type: widget.type,
        pressed: pressed,
        pressedTop: widget.pressedTop,
        pressedLeft: widget.pressedLeft,
        ),
    );
  }
}


  String movePng(MonsterTypes type){
    switch(type){
      case MonsterTypes.GOD:
        return "godButton.png";
      case MonsterTypes.HUMAN:
        return "humanButton.png";
      case MonsterTypes.SUN:
        return "sunButton.png";
      case MonsterTypes.EARTH:
        return "earthButton.png";
      case MonsterTypes.MOON:
        return "moonButton.png";
      default:
        return "noneButton.png";
    }
  }