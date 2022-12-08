import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/widgets/cost/costCone.dart';



class CostConeList extends ConsumerWidget{
  CostConeList({
    Key? key,
    required this.coneWidth
    }):super(key: key);

  final double coneWidth;

  @override
  Widget build(context,WidgetRef ref){
    final prov = ref.watch(choiceProvider);
    final opacitylist = prov.mo.costOpacityList;

    final List<Widget> list_here = [
      for(var i=0; i<15; i++)...[
        CostConeAnimated(
          opacity: opacitylist[i],
          width: coneWidth,
          )
      ]
    ];


    return SizedBox(
      height: coneWidth * 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            height: coneWidth * 1.25,
            child: Row(
              children: [
                for(var i=0;i<8;i++)...[
                  list_here[i*2]
                ]
              ],
            ),
          ),

          SizedBox(
            height: coneWidth * 1.25,
            child: Row(
              children: [
                for(var i=0;i<7;i++)...[
                  list_here[i*2 + 1]
                ]
              ],
            ),
          ),
        ],
      )
    );

  }
}