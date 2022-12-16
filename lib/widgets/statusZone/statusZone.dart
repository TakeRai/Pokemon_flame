import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/common/types.dart';
import 'package:pokemon_flame/widgets/ailmentIcon.dart';
import 'package:pokemon_flame/widgets/designedText.dart';
import 'package:pokemon_flame/widgets/hpText.dart';
import 'package:pokemon_flame/widgets/hpbar.dart';
import 'package:pokemon_flame/widgets/typeIcon.dart';

class StatusZone extends ConsumerWidget{

  StatusZone({
    Key? key,
    required this.isPlayer,
    required this.type1,
    this.type2,
    required this.width,
    required this.height
  }):super(key: key);

  final bool isPlayer;
  final MonsterTypes type1;
  final MonsterTypes? type2;
  final double width;
  final double height;

  @override
  Widget build(context, WidgetRef ref){

    final battleProv = ref.watch(battleProvider);
    final remainHP = battleProv.mo.playerRemainHP;

    int imgIndex = isPlayer ? 1 : 2;
    int maxHP = 400;
    double ailmentWidth = 42;
    double ailmentHeight = 20;

    return Container(
      width: width,height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/吹き出し$imgIndex.png"),
          fit: BoxFit.fill
        )
      ),
      child: Row(
        children: [
          if(isPlayer)
            SizedBox(width: width*0.3,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("モンスタモンスタ",style: desigedStyle(12,letter: 0)),
              const Spacer(),
              Row(
                children: [
                  TypeIcon(type: type1),
                  SizedBox(width: 3,),
                  if(type2 != null)
                    TypeIcon(type: type2!),
                ],
              ),
              const Spacer(),
              HPBar(
                height: height/15, 
                width: width*0.7 * 0.95,
                maxHP: maxHP, 
                remainHP: remainHP
                ),
              HPText(maxHP: maxHP, remainHP: remainHP, fontsize: 12),
              AilmentIcon(
                width: ailmentWidth,
                height: ailmentHeight,
                leftmargin: width*0.7 - ailmentWidth - 5,
              ),
              const SizedBox(height: 3,)
            ],
          ),
          
        ],
      ),
    );
  }
}