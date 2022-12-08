
import 'package:flame/game.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flame/main.dart';
import 'package:pokemon_flame/utils/sounds.dart';
import 'package:pokemon_flame/widgets/button/animeButton.dart';

class StartPage extends StatefulWidget{
  const StartPage({super.key});

  @override
  State<StartPage> createState() => StartPageState();
}

class StartPageState extends State<StartPage>{
  

  @override
  void initState(){
    super.initState();
    Sounds.playStartBgm();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/babel.jpeg"),
            fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button1Gesture(
              opacity: 1,
              text: "START", 
              fontsize: 34,
              tap: (){
                GoRouter.of(context).replace("/home");
              },
              height: 100,
              ),

            const SizedBox(height: 200,)
          ],
        ),
      ),
    );
  }
}

