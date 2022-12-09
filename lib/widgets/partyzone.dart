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
    required this.index,
    required this.boxHeight,
    }):super(key: key);

  final int index;
  final double boxHeight;

  @override
  Widget build(context,WidgetRef ref){
    final prov = ref.watch(choiceProvider);
    // final partyBools = prov.mo.partyBools; 

    if(prov.mo.choicedMonsterCosts != -1){
      return DragCard(dragCardWidth: boxHeight,);
    }

    return MagicBox( index: index,boxHeight: boxHeight,);

  }
}

class PartyZoneGesture extends ConsumerWidget{
  const PartyZoneGesture({
    Key? key,
    required this.keylist,
    required this.index,
    required this.boxHeight,
    required this.deviceHeight
    }):super(key: key);

  final List<GlobalKey> keylist;
  final int index;
  final double boxHeight;
  final double deviceHeight;

  @override
  Widget build(context,WidgetRef ref){
    final prov = ref.watch(choiceProvider);
    final insetBool = prov.mo.partyZoneInsetsBools[index];
    return GestureDetector(
      key: keylist[index],
      onTap:insetBool ? 
      () {
        // prov.partyBoolChange(index, false);
        print("ok");
      } :
      null,
      onLongPressStart: insetBool ? (details) {
        // prov.cardLongPressStart(
        //   details: details, 
        //   keylist: keylist, 
        //   index: index, 
        //   dragCardWidth: boxHeight,
        //   );
        // prov.partyInsetsBoolChange(index, false);
        // prov.partyBoolChange(index, false);
      } : null,
      onLongPressMoveUpdate: (details) {
        // prov.dragpositionChange(
        //   details: details,
        //   dragCardWidth: boxHeight
        // );
      } ,
      onLongPressEnd: (details) {
        // prov.cardLongPressEnd(details, keylist, index);
      } ,
      child: Partyzone(index: index,boxHeight: boxHeight,),
    );
  }
}