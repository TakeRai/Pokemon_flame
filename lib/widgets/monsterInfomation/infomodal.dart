import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/widgets/designedText.dart';
import 'package:pokemon_flame/widgets/monsterInfomation/infotitle.dart';
import 'package:pokemon_flame/widgets/monsterInfomation/radarchart.dart';

class InfoModal extends ConsumerStatefulWidget{

  const InfoModal({
    Key? key,
    required this.availableHeight
  }):super(
    key: key
  );

  final double availableHeight;

  @override
  ConsumerState<InfoModal> createState() => InfoModalState();
}

class InfoModalState extends ConsumerState<InfoModal>{

  static double radius = 10;

  @override
  Widget build(context){
    
    final provider = ref.watch(choiceProvider);

    if(provider.mo.infoCost == -1){
      return SizedBox.shrink();
    }


    return Container(
      margin: EdgeInsets.only(right: 30,left: 30,bottom: 10),
      height: widget.availableHeight * 0.5,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.85),
        border: Border.all(width: 1.5,color: Color.fromARGB(255, 158, 103, 83)),
        borderRadius: BorderRadius.circular(radius)
      ),
      
      child: Column(
        children: [
          InfoTitle(
            availableHeight: widget.availableHeight,
            radius: radius,
            ),
          StatusRadar(height: 300)
        ],
      ),
    );
  }
}