import 'package:flame/game.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/party/partyPage.dart';
import 'package:pokemon_flame/repository/wholeRepository.dart';
import 'package:pokemon_flame/startPage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}


class MyApp extends StatefulWidget{
  MyApp({super.key});
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GoRouter _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return SafeArea(child: StartPage());
          // return blackoutRoute(SafeArea(child: StartPage()));
        },
        ),

      GoRoute(
        path: "/home",
        pageBuilder: (context, state) {
          return blackoutRoute(SafeArea(child: ChoicePage()));
        },
        
        ),
      GoRoute(
        path: "/battle",
        pageBuilder: (context, state) {
          return blackoutRoute(SafeArea(child: BattlePage()));
          // return SafeArea(child: BattlePage());
        },
      ),
      
      GoRoute(
        path: "/party",
        pageBuilder: (context,state){
          return blackoutRoute(SafeArea(child: PartyPage()));
        },

      )
    ]
    );


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp.router(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "dot"
      ),
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: "Flutter Demo",

    );
  }

}

CustomTransitionPage blackoutRoute(Widget page){
  return CustomTransitionPage(
    child: page,
    transitionDuration: Duration(milliseconds: 750),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final color = ColorTween(
        begin: Colors.transparent,
        end: Colors.black
      ).animate(CurvedAnimation(
        parent: animation, 
        curve: Interval(
          0,0.5,
          curve: Curves.easeInOut
        ))
        );

      final opacity = Tween<double>(
        begin: 0,end: 1
      ).animate(CurvedAnimation(
        parent: animation, 
        curve: Interval(
          0.5,1.0,curve: Curves.easeInOut
        )));

      return AnimatedBuilder(
        animation: animation, 
        builder:(context, child) {
          return Container(
            color: color.value,
            child: Opacity(
              opacity: opacity.value,
              child: child,
            ),
          );
        },
        child: child,
        );
    },

    );
}




