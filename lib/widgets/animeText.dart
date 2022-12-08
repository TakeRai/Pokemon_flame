import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class TypedTextDelayed extends ConsumerStatefulWidget{
  const TypedTextDelayed({Key? key,required this.text}):super(key: key);

  final String text;

  ConsumerState<TypedTextDelayed> createState() => TypedTextDelayedState();
}

class TypedTextDelayedState extends ConsumerState<TypedTextDelayed>{

  @override
  Widget build(context){
    final prov = ref.watch(choiceProvider);

    if(!prov.mo.startAnimText){
      return const SizedBox(
        height: 40,
        child: null,
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