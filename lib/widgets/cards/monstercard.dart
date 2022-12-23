import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/choice/choiceConfig.dart';
import 'package:pokemon_flame/widgets/cards/basecard.dart';


class BaseCardOpacity extends StatelessWidget{
  const BaseCardOpacity({
    Key? key,
    required this.costIndex,
    required this.opacity,
    required this.width,
    required this.fontSize
    }):super(key: key);

  final int costIndex;
  final double opacity;
  final double width;
  final double fontSize;

  @override
  Widget build(context){
    return AnimatedOpacity(
      opacity: opacity, 
      duration: Duration(milliseconds: Config_Choice.cardOpacitySpeed),
      child: BaseCard(
        costIndex: costIndex,
        width: width,
        fontSize: fontSize,
      ),
    );
  }
}




class MonsterCard extends ConsumerWidget{

  const MonsterCard({
    Key? key,
    required this.keylist,
    required this.opacity,
    required this.costIndex,
    required this.monsterCardWidth,
    required this.dragCardWidth,
    required this.deviceHeight,
    required this.fontSize,
    required this.safeAreaTop
    }):super(key: key);

  final List<GlobalKey> keylist;
  final double opacity;
  final int costIndex;
  final double monsterCardWidth;
  final double dragCardWidth;
  final double deviceHeight;
  final double fontSize;
  final double safeAreaTop;

  

  @override
  Widget build(BuildContext context,WidgetRef ref){
    final prov = ref.watch(choiceProvider);
    final choicedCosts = prov.mo.choicedMonsterCosts;
    bool choicedThis = choicedCosts.contains(costIndex);



    return SizedBox(
      height: monsterCardWidth * Config_Choice.cardHeightMagni,
      width: monsterCardWidth,
      child: GestureDetector(
        child: BaseCardOpacity(
          costIndex: costIndex,
          opacity: opacity,
          width: monsterCardWidth,
          fontSize: fontSize,
          ),
        onTap: (){
          prov.monsterCardTap(costIndex);

        },
        onLongPressStart: choicedThis ? null :
         (details) {
            prov.cardLongPressStart(
              details: details, 
              cardIndex: costIndex, 
              dragCardWidth: dragCardWidth,
              );
            prov.cardRippleStart(keylist,safeAreaTop);
         },

        onLongPressMoveUpdate: choicedThis ? null :
        (details){
            prov.dragpositionChange(
              details:details,
              dragCardWidth: dragCardWidth
              );
        },
        onLongPressEnd: choicedThis ? null : 
        (details)  {
          prov.cardLongPressEnd(
            details: details, 
            keylist: keylist, 
            boxHeight: dragCardWidth
            );
        },
      )
    );
  }
}