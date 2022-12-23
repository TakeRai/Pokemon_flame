import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/widgets/button/animeButton.dart';

class InitialBox extends ConsumerWidget{

  

  InitialBox({
    Key? key,
    required this.dialogHeight
  }):super(key: key);

  final double dialogHeight;
  AssetImage buttonImage = AssetImage("assets/images/button_battle3.png");

  @override
  Widget build(context,ref){
    final prov = ref.watch(battleProvider);
    

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Button1Gesture(
              opacity: 1,
              text: "わざ", 
              fontsize: 22,
              tap: (){
                prov.PageIndexChange(1);
              },
              height: dialogHeight * 0.35,
              image: buttonImage,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button1Gesture(
              opacity: 1,
              text: "パーティー", 
              fontsize: 22,
              tap: (){
                GoRouter.of(context).push("/party");
              },
              height: dialogHeight * 0.35,
              image: buttonImage,
            ),
            Button1Gesture(
              opacity: 1,
              text: "逃げる", 
              fontsize: 22,
              tap: (){
                print("逃げる");
              },
              height: dialogHeight * 0.35,
              image: buttonImage,
            ),
          ],
        )
      ],
    );
  }
}