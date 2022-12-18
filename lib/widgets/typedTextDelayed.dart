import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/widgets/designedText.dart';


class TypedTextDelayed extends StatefulWidget{

  const TypedTextDelayed({
    Key? key,
    required this.text,
    required this.duration
    }):
    super(key: key);

  final String text;
  final Duration duration;

  State<TypedTextDelayed> createState() => TypedTextDelayedState();
}

class TypedTextDelayedState extends State<TypedTextDelayed>{


  bool startAnimText = false;
  

  @override 
  void initState(){
    super.initState();
    print("startAnimText$startAnimText");
    Future.delayed(widget.duration).then((value) {
      setState(() {
        startAnimText = true;
      });
    });
  }

  @override
  Widget build(context){

    if(!startAnimText){
      return const SizedBox(
        height: 40,
      );
    }
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
        widget.text,
        speed: const Duration(milliseconds: 80),
        textAlign: TextAlign.center,
        textStyle: desigedStyle(26)
        ),
      ],
      isRepeatingAnimation: false,
    );

  }

}
