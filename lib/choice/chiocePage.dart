
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/battle/dialogbox.dart';
import 'package:pokemon_flame/main.dart';
import 'package:pokemon_flame/widgets/button/animeButton.dart';
import 'package:pokemon_flame/widgets/ripple/ripple.dart';
import 'package:pokemon_flame/widgets/animeText.dart';
import 'package:pokemon_flame/widgets/cards/dragcards.dart';
import 'package:pokemon_flame/widgets/cards/monstercard.dart';
import 'package:pokemon_flame/widgets/cost/costCone.dart';
import 'package:pokemon_flame/widgets/cost/costconelist.dart';
import 'package:pokemon_flame/widgets/partyzone.dart';
import 'package:pokemon_flame/repository/choiceRepository/choiceRepository.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'dart:math';
import 'dart:ui' as ui;

import 'choiceConfig.dart';

final choiceProvider = ChangeNotifierProvider.autoDispose(
  (ref) => ChoiceRepository(),
  );

class ChoicePage extends ConsumerStatefulWidget{
  const ChoicePage({Key? key}):super(key: key);

  ConsumerState<ChoicePage> createState() => ChoicePageState();
}

class ChoicePageState extends ConsumerState<ChoicePage>{

  final List<GlobalKey> _key = [
    for(var i=0; i<3; i++)...[
      GlobalKey()
      
    ]
  ];

  @override
  void initState(){
    super.initState();
    
    Future.delayed(const Duration(milliseconds: 1000)).then(
      (value){
        final choiceprov = ref.watch(choiceProvider);
        choiceprov.startDelayedText();
      });
    
  }

  @override
  Widget build(context){

    final choiceprov = ref.watch(choiceProvider);
    final battleprov = ref.watch(battleProvider);
    final deviceWidth = MediaQuery.of(context).size.width;
    final availableHeight = MediaQuery.of(context).size.height 
      - AppBar().preferredSize.height 
      - MediaQuery.of(context).padding.top 
      - MediaQuery.of(context).padding.bottom 
      - kBottomNavigationBarHeight;
    final safeAreaTop = MediaQueryData.fromWindow(ui.window).padding.top;


    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                    children: [
                      Container(
                        width: deviceWidth /5,
                        height: deviceWidth / 5 * 1.25,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/costCircle3.png"),
                            fit: BoxFit.fill
                          )
                        ),
                        child: const Text(
                          "15",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "dot",
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),),
                      ),

                      CostConeList(
                        coneWidth: deviceWidth / 10,
                      )
                    ],
                  ),

                Spacer(flex: 5,),

                SizedBox(
                  height: deviceWidth * Config_Choice.cardWidthMagni * Config_Choice.cardHeightMagni,
                  child: ScrollSnapList(
                    itemBuilder: (p0, p1) {
                      return MonsterCard(
                        keylist: _key,
                        opacity: 
                          choiceprov.mo.choicedMonsterCosts.contains(p1) || 
                          choiceprov.mo.dragCost == p1
                          ? 0.3 : 1,
                        costIndex: p1,
                        monsterCardWidth: deviceWidth * Config_Choice.cardWidthMagni,
                        dragCardWidth: deviceWidth * 0.78 /3,
                        deviceHeight: MediaQuery.of(context).size.height,
                        fontSize: 20,
                        safeAreaTop: safeAreaTop,
                        );
                    },
                    itemCount: 10, 
                    itemSize: deviceWidth * Config_Choice.cardWidthMagni, 
                    onItemFocus: choiceprov.focusedIndexChange,
                    duration: 100,
                    dynamicItemSize: true,
                    // scrollPhysics: const NeverScrollableScrollPhysics(),
                  ),
                ),

                Spacer(flex: 4,),

                SizedBox(
                  height: availableHeight * 0.2,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for(var i=0; i<3; i++)...[
                      PartyZoneGesture(
                        keylist: _key, 
                        partyZoneIndex: i, 
                        boxHeight: deviceWidth * 0.78 /3, 
                        deviceHeight: MediaQuery.of(context).size.height
                        )
                    ],
                  ],
                ),
                ),

                const Spacer(flex: 8,),

                DialogBox(
                  height: MediaQuery.of(context).size.height * 0.2, 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TypedTextDelayed(text: "モンスターを3体を選ぼう"),
                      Button1Gesture(
                        opacity: choiceprov.mo.isAbleGoBattle ? 1 :0.3,
                        text: "バトルへ", 
                        fontsize: 24,
                        tap: choiceprov.mo.isAbleGoBattle ? (){
                          GoRouter.of(context).push("/battle");
                          Future.delayed(Duration(milliseconds: 100)).then((_){
                            battleprov.MonsterOpChange_P(1);
                          });
                        } : (){},
                        height: 75,
                        )
                    ],
                  ),
                  ),
              ],
            ),

            

            Visibility(
              visible: choiceprov.mo.dragCost >= 0 ? true : false,
              child: Positioned(
                top: choiceprov.mo.top_drag - safeAreaTop,
                left: choiceprov.mo.left_drag,
                  child: DragCard(
                    dragCardWidth: deviceWidth * 0.78 /3,
                  ),
                )

              ),


            for(var i=0; i< choiceprov.mo.ripplelist.length; i++)...[
              choiceprov.mo.ripplelist[i]
            ],
          ],
        )
      )
    );
  }

}

