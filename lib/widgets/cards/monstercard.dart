import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/choice/choiceConfig.dart';
import 'package:pokemon_flame/widgets/cards/basecard.dart';



class BaseCardOpacity extends StatelessWidget{
  const BaseCardOpacity({
    Key? key,
    required this.opacity,
    required this.width,
    required this.fontSize
    }):super(key: key);

  final double opacity;
  final double width;
  final double fontSize;

  @override
  Widget build(context){
    return AnimatedOpacity(
      opacity: opacity, 
      duration: Duration(milliseconds: Config_Choice().opacitySpeed),
      child: BaseCard(
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
    required this.index,
    required this.monsterCardWidth,
    required this.dragCardWidth,
    required this.deviceHeight,
    required this.fontSize,
    required this.safeAreaTop
    }):super(key: key);

  final List<GlobalKey> keylist;
  final double opacity;
  final int index;
  final double monsterCardWidth;
  final double dragCardWidth;
  final double deviceHeight;
  final double fontSize;
  final double safeAreaTop;

  @override
  Widget build(BuildContext context,WidgetRef ref){
    final prov = ref.watch(choiceProvider);
    final choicedCosts = prov.mo.choicedMonsterCosts;

    return SizedBox(
      height: monsterCardWidth * 1.5,width: monsterCardWidth,
      child: GestureDetector(
        child: BaseCardOpacity(
          opacity: opacity,
          width: monsterCardWidth,
          fontSize: fontSize,
          ),
        onTap: (){
          prov.costOpaChangeRand();
        },
        onLongPressStart:(details) {
          // if(choicedCosts.contains(index)) {
            prov.cardLongPressStart(
              details: details, 
              keylist: keylist, 
              cardIndex: index, 
              dragCardWidth: dragCardWidth,
              );
            prov.cardRippleStart(keylist,safeAreaTop);
            // prov.cardOpaChange(index, 0.3);
            // prov.cardChiocedChange(index, true);
          // }
        },

        onLongPressMoveUpdate: (details){
          // if(!prov.mo.cardChoicedBools[index]){
            prov.dragpositionChange(
              details:details,
              dragCardWidth: dragCardWidth
              );
          // }
        },
        onLongPressEnd: (details)  {
          // if(!prov.mo.cardChoicedBools[index]){
            prov.cardLongPressEnd(details, keylist, index);
          // }
        },

        
      )
      
      
    
    );
  }
}