import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flame/choice/chiocePage.dart';
import 'package:pokemon_flame/choice/choiceConfig.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class Button1 extends StatelessWidget{
  const Button1({
    Key? key,
    required this.text,
    required this.height,
    required this.fontsize,
    }):super(key: key);

  final String text;
  final double height;
  final double fontsize;

  @override
  Widget build(context){
    return Container(
      width: height*2,
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/button_battle3.png"),
          fit: BoxFit.fill
          )
      ),
      child: Center(
        child: Text(
          text,
          style: desigedStyle(fontsize)
          ),
      ),
    );
  }
}

class Button1Opacity extends ConsumerStatefulWidget{
  const Button1Opacity({
    Key? key,
    required this.opacity,
    required this.text,
    required this.height,
    required this.fontsize,
    }):super(key: key);

  final double opacity;
  final String text;
  final double height;
  final double fontsize;

  ConsumerState<Button1Opacity> createState() => Button1OpacityState();
}

class Button1OpacityState extends ConsumerState<Button1Opacity>{

  @override
  Widget build(context){
    final prov = ref.watch(choiceProvider);
    return AnimatedOpacity(
      opacity: widget.opacity, 
      duration: const Duration(milliseconds: Config_Choice.cardOpacitySpeed),
      child: Button1(text: widget.text,height: widget.height,fontsize: widget.fontsize,),
      );
  }

}

class Button1Gesture extends ConsumerStatefulWidget{
  const Button1Gesture({
    Key? key,
    required this.opacity, 
    required this.text,
    required this.fontsize,
    required this.tap,
    required this.height,
    }):super(key: key);

  final double opacity;
  final String text;
  final double fontsize;
  final void Function() tap;
  final double height;

  ConsumerState<Button1Gesture> createState() => Button1GestureState();
}

class Button1GestureState extends ConsumerState<Button1Gesture>{

  @override
  Widget build(context){
    return GestureDetector(
      onTap: widget.tap,
      child: Button1Opacity(
        opacity: widget.opacity,
        text: widget.text,
        fontsize: widget.fontsize,
        height: widget.height),
    );
  }
}