import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/battle/dialogbox.dart';
import 'package:pokemon_flame/common/types.dart';
import 'package:pokemon_flame/repository/battleRepository.dart';
import 'package:pokemon_flame/utils/sounds.dart';
import 'package:pokemon_flame/widgets/button/animeButton.dart';
import 'package:pokemon_flame/widgets/monsterspot.dart';
import 'package:pokemon_flame/widgets/movebox.dart';
import 'package:pokemon_flame/widgets/statusZone/statusZone.dart';

final battleProvider = ChangeNotifierProvider.autoDispose(
  (ref) => BattleRepository(),
  );

class BattlePage extends ConsumerStatefulWidget{
  const BattlePage({Key? key}):super(key: key);

  ConsumerState<BattlePage> createState() => BattlePageState();
}

class BattlePageState extends ConsumerState<BattlePage>{

  EffectSample? effect1;
  EffectSample? effect2;

  @override
  void initState(){
    super.initState();

    
    
    Flame.images.loadAll(["bolt.png"]).then((image){
      
      setState(() {
        effect1 = EffectSample(
          spriteImage: image[0],
          WandH: MediaQuery.of(context).size.width * 0.5
          );
        
        effect2 = EffectSample(
          spriteImage: image[0],
          WandH: MediaQuery.of(context).size.width * 0.5
          );
      },);
      Sounds.playBattleBgm();

    });

  }

  

  @override
  Widget build(context){
    final prov = ref.watch(battleProvider);

    final deviceWidth = MediaQuery.of(context).size.width;

    final safeAreaTop = MediaQueryData.fromWindow(ui.window).padding.top;
    final safeAreaBottom = MediaQueryData.fromWindow(ui.window).padding.bottom;
    final availableHeight = MediaQuery.of(context).size.height - safeAreaTop - safeAreaBottom;
    final dialogHeight = availableHeight * 0.3;
    

    if(effect1 == null || effect2 == null){
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: availableHeight * 0.7,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/battlebg0.jpeg",
                ),
                fit: BoxFit.cover
              )
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 50,
                  child: StatusZone(
                    isPlayer: false,
                    type1: MonsterTypes.SUN,
                    type2: MonsterTypes.GOD,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.5 * 0.6,
                    )
                  ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MonsterSpot(
                        opacity: prov.mo.playerMonsterOpacity, 
                        height: MediaQuery.of(context).size.width * 0.5, 
                        monsterPath: "朱雀1.png", 
                        effect: GameWidget(game: effect1!)
                        ),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),

                Positioned(
                  right: 0,
                  bottom: 70,
                  child: StatusZone(
                    isPlayer: true,
                    type1: MonsterTypes.EARTH,
                    type2: MonsterTypes.MOON,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.5 * 0.6,
                    )
                  ),
                Align(
                  alignment: Alignment.topRight,
                  child: MonsterSpot(
                    opacity: prov.mo.playerMonsterOpacity, 
                    height: deviceWidth * 0.5, 
                    monsterPath: "朱雀1.png", 
                    effect: GameWidget(game: effect2!)
                    ),
                )
              ],
            ),
          ),

          DialogBox(
            height: dialogHeight, 
            child: prov.mo.choiceMovesPage ?
              MoveBox(boxHeight: dialogHeight,devicewidth: deviceWidth) :
              Column(
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
                          prov.choiceMove(true);
                        },
                        height: dialogHeight * 0.35,
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
                      ),
                      Button1Gesture(
                        opacity: 1,
                        text: "逃げる", 
                        fontsize: 22,
                        tap: (){
                          print("逃げる");
                        },
                        height: dialogHeight * 0.35,
                      ),
                    ],
                  )
                ],
              )
            ),

        ],
        
      )
    );
  }
}

class EffectSample extends FlameGame{
  EffectSample({
    required this.spriteImage,
    required this.WandH
    }):super();

  final ui.Image spriteImage;
  final double WandH;
  
  @override
  ui.Color backgroundColor(){
    return ui.Color.fromARGB(255, 0, 0, 0).withOpacity(0);
  }

  Future<void> onLoad() async {
    // add(Bg());
    add(Effect(
      spriteImage: spriteImage,
      WandH: WandH
      ));
  }
}

class Effect extends PositionComponent with HasGameRef<FlameGame>{

  Effect({
    required this.spriteImage,
    required this.WandH
    }):super();

  final ui.Image spriteImage;
  final double WandH;

  @override
  Future? onLoad(){

    // add(Bg());
    add(
      SpriteAnimationComponent(
        size: Vector2(WandH,WandH),
        animation: SpriteAnimation.spriteList(
          [
            for(var i=0;i<8;i++)...[
              Sprite(
                spriteImage,
                srcSize: Vector2(130,130),
                srcPosition: Vector2(130.0*i,0)
              ),
            ]
          ], 
          stepTime: 0.125,
          loop: false
          ),
        
      )
    );
  }

  
}

class Bg extends Component {
  Vector2 size = Vector2.zero();

  late final ui.Paint _paint = ui.Paint()..color = const ui.Color.fromARGB(255, 255, 0, 0).withOpacity(1);

  @override
  void render(ui.Canvas c){
    final rect = ui.Rect.fromLTWH(0, 0, size.x, size.y);
    c.drawRect(rect, _paint);
  }

  @override
  void onGameResize(Vector2 gamesize){
    size = Vector2(gamesize.x, gamesize.y);
  }

}


