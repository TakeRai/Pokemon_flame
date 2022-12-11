import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/choice/choiceConfig.dart';
import 'package:pokemon_flame/widgets/cards/dragcards.dart';

class MagicBox extends StatelessWidget{
  const MagicBox({
    Key? key,
    required this.index,
    required this.boxHeight
    }):super(key: key);

  // final List<GlobalKey> keylist;
  final int index;
  final double boxHeight;

  @override
  Widget build(context){
    return Container(
      // key: keylist[index],
      width: boxHeight,
      height: boxHeight,
      decoration: BoxDecoration(
        color: Color(0xFF7D00FF),
        borderRadius: BorderRadius.circular(boxHeight/10),
        border: Border.all(
          width: boxHeight * 0.03,
          color: const Color.fromARGB(255, 189, 127, 255)
          )
      ),
      child: Center(
        child: SizedBox(
          width: boxHeight * 0.9,
          height: boxHeight * 0.9,
          child: Image.asset("assets/images/魔法陣.png",fit: BoxFit.fill,),
        ),
      ),
    );
  }
}



class Partyzone extends ConsumerWidget{
  const Partyzone({
    Key? key,
    required this.partyZoneIndex,
    required this.boxHeight,
    }):super(key: key);

  final int  partyZoneIndex;
  final double boxHeight;

  @override
  Widget build(context,WidgetRef ref){
    final prov = ref.watch(choiceProvider);

    if(prov.mo.choicedMonsterCosts[partyZoneIndex] <0){
      return MagicBox( index: partyZoneIndex,boxHeight: boxHeight,);
    }else if(prov.mo.choicedMonsterCosts[partyZoneIndex] == prov.mo.dragCost){
      return MagicBox( index: partyZoneIndex,boxHeight: boxHeight,);
    }

    return DragCard(dragCardWidth: boxHeight,);

  }
}

class PartyZoneGesture extends ConsumerWidget{
  const PartyZoneGesture({
    Key? key,
    required this.keylist,
    required this.partyZoneIndex,
    required this.boxHeight,
    required this.deviceHeight
    }):super(key: key);

  final List<GlobalKey> keylist;
  final int partyZoneIndex;
  final double boxHeight;
  final double deviceHeight;

  @override
  Widget build(context,WidgetRef ref){
    final prov = ref.watch(choiceProvider);
    final indexCosts = prov.mo.choicedMonsterCosts[partyZoneIndex];

    return GestureDetector(
      key: keylist[partyZoneIndex],
      onTap:
      () {
      },
      onLongPressStart:indexCosts == -1 ? null :
        (details) {
          prov.partyZoneDragStart(
            partyZoneIndex: partyZoneIndex, 
            details: details, 
            dragCardWidth:boxHeight
            );
        },

      onLongPressMoveUpdate: indexCosts == -1 ? null :
        (details) {
          prov.dragpositionChange(
            details: details, 
            dragCardWidth: boxHeight
            );
        },

      onLongPressEnd: indexCosts == -1 ? null :
        (details) {
          prov.partyZoneDragEnd(
            details: details, 
            keylist: keylist, 
            partyZoneIndex: partyZoneIndex,
            boxHeight: boxHeight);
        },
      child: Partyzone(partyZoneIndex: partyZoneIndex,boxHeight: boxHeight,),
    );
  }
}