import 'package:flame/game.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flame/battle/battlePage.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/repository/wholeRepository.dart';
import 'package:pokemon_flame/startPage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// final wholeProvider = ChangeNotifierProvider.autoDispose(
//   (ref) => WholeRepository(),
//   );

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
        },
        ),

      GoRoute(
        path: "/home",
        builder: (context,state){
          // return ChoicePage();
          return SafeArea(child: ChoicePage());
          
        }
        
        ),

      GoRoute(
        path: "/battle",
        builder: (context, state) {
          return SafeArea(child: BattlePage());
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




