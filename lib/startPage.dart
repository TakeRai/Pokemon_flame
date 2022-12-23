
import 'package:flame/game.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flame/main.dart';
import 'package:pokemon_flame/utils/sounds.dart';
import 'package:pokemon_flame/widgets/button/animeButton.dart';

class StartPage extends StatefulWidget{
  StartPage({super.key});

  @override
  State<StartPage> createState() => StartPageState();
}

class StartPageState extends State<StartPage>{
  
  AssetImage babel = const AssetImage("assets/images/babel.jpeg");
  AssetImage button = const AssetImage("assets/images/button_battle3.png");

  @override
  void initState(){
    super.initState();
    Sounds.playStartBgm();


  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([
          precacheImage(babel, context),
          precacheImage(button, context),
          precacheImage(AssetImage("assets/images/button/earthButton.png"), context),
          precacheImage(AssetImage("assets/images/button/godButton.png"), context),
          precacheImage(AssetImage("assets/images/button/humanButton.png"), context),
          precacheImage(AssetImage("assets/images/button/moonButton.png"), context),
          precacheImage(AssetImage("assets/images/button/sunButton.png"), context),
          precacheImage(AssetImage("assets/images/button/noneButton.png"), context),
          precacheImage(AssetImage("assets/images/dragcard_red.png"), context),
          precacheImage(AssetImage("assets/images/costCircle3.png"), context),
          FlameAudio.audioCache.loadAll(['se/thunder.mp3'])
          
        ]),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: babel,
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
                  image: button,
                  ),

                const SizedBox(height: 200,)
              ],
            ),
          );
        }
        ),
    );
  }


}

