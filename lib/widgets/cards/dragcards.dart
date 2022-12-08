import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';



class DragCard extends StatelessWidget{

  const DragCard({
    Key? key,
    required this.dragCardWidth
  }):super(key: key);
  
  final double dragCardWidth;

  @override
  Widget build(context){

    return Container(
      width: dragCardWidth ,
      height: dragCardWidth ,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/dragcard_red.png"),
          fit: BoxFit.fill
        )
      ),
      child: Center(
        child: Container(
          width: dragCardWidth * 0.9,
          height: dragCardWidth * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(dragCardWidth * 0.04),
            image: const DecorationImage(
              image: AssetImage("assets/images/amon-face.png"),
              fit: BoxFit.fill
            )
          ),
        ),
      ),
    );
  }
}



class GestureDragCard extends ConsumerWidget{
  
  const GestureDragCard({
    Key? key,
    required this.keylist,
    required this.index,
    required this.dragCardWidth
    }):super(key: key);

  final List<GlobalKey> keylist;
  final int index;
  final double dragCardWidth;

  @override
  Widget build(context, WidgetRef ref){
    final prov = ref.watch(choiceProvider);
    return GestureDetector(
      key: keylist[index],
      onTap: (){
        prov.partyBoolChange(index, false);
      },
      child: DragCard(
        dragCardWidth: dragCardWidth,
      ),
    );
  }
}