import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonsterSpot extends ConsumerStatefulWidget{

  const MonsterSpot({
    Key? key,
    required this.opacity,
    required this.height,
    required this.monsterPath,
    required this.effect
    }):super(key: key);

  final double opacity;
  final double height;
  final String monsterPath;
  final Widget effect;

  @override
  ConsumerState<MonsterSpot> createState() => MonsterSpotState();
}

class MonsterSpotState extends ConsumerState<MonsterSpot>{

  @override
  Widget build(context){
    final path = widget.monsterPath;

    return SizedBox(
      width: widget.height,
      height: widget.height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: widget.height,
              height: widget.height * 0.3,
              child: Image.asset(
                "assets/images/魔法陣.png",
                fit: BoxFit.fill,
                ),
            ),
          ),

          AnimatedOpacity(
            opacity: widget.opacity, 
            duration: Duration(milliseconds: 500),
            child: SizedBox(
              width: widget.height,
              height: widget.height,
              child: Image.asset(
                "assets/images/$path",
                fit: BoxFit.fill,
              ),
            ),
            ),

          SizedBox(
            width: widget.height,
            height: widget.height,
            child: widget.effect,
          )
        ],
      ),
    );
  }
}