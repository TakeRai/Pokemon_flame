import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/utils/sounds.dart';
import 'package:pokemon_flame/widgets/designedText.dart';
import 'package:pokemon_flame/widgets/typedTextDelayed.dart';

class RaptBattleBox extends ConsumerStatefulWidget{

  @override
  ConsumerState<RaptBattleBox> createState() => RaptBattleBoxState();
}

class RaptBattleBoxState extends ConsumerState<RaptBattleBox>{

  GlobalKey key0 = GlobalKey();
  GlobalKey key1 = GlobalKey();
  late TypedTextDelayed text;

  @override
  void initState() {
    super.initState();
    text = TypedTextDelayed(key: key0,text: "ここはrapt",duration: Duration(milliseconds: 50),);
    FlameAudio.audioCache.loadAll(['se/thunder.mp3']);
    animFlow();

  }

  @override
  Widget build(context){
    return Center(child: text);
  }

  void animFlow() async{
   Future.delayed(Duration(milliseconds: 1000)).then((value){
      final prov = ref.watch(battleProvider);
      prov.AnimationSwitch(0, true);
      FlameAudio.play('se/thunder.mp3');
      
    });

    Future.delayed(Duration(milliseconds: 1750)).then((value){
      final prov = ref.watch(battleProvider);
      prov.SetHPSmooth();
    });

    Future.delayed(Duration(milliseconds: 2000)).then((value){
      final prov = ref.watch(battleProvider);
      prov.AnimationSwitch(0, false);
    });

    Future.delayed(Duration(milliseconds: 3000)).then((value){
      setState(() {
      text = TypedTextDelayed(key: key1,text: "効果はばつぐん",duration: Duration(milliseconds: 50),);
    });
    });
  }
}