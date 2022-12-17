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
    required this.pressed
    }):super(key: key);

  final String text;
  final double height;
  final double fontsize;
  final bool pressed;

  @override
  Widget build(context){
    return Container(
      margin: EdgeInsets.only(top: pressed ? height/20:0),
      width: height*2,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/button_battle3.png"),
          fit: BoxFit.fill,
          colorFilter: pressed ? ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.srcATop) : null
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
    required this.pressed
    }):super(key: key);

  final double opacity;
  final String text;
  final double height;
  final double fontsize;
  final bool pressed;

  ConsumerState<Button1Opacity> createState() => Button1OpacityState();
}

class Button1OpacityState extends ConsumerState<Button1Opacity>{

  @override
  Widget build(context){
    final prov = ref.watch(choiceProvider);
    return AnimatedOpacity(
      opacity: widget.opacity, 
      duration: const Duration(milliseconds: Config_Choice.cardOpacitySpeed),
      child: Button1(
        text: widget.text,height: widget.height,
        fontsize: widget.fontsize,
        pressed: widget.pressed,
        ),
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

  bool pressed = false;

  @override
  Widget build(context){
    return Stack(children: [
      Container(
        width: widget.height*2,height: widget.height,
        margin: EdgeInsets.only(top: widget.height/20),
        child: Image.asset(
          "assets/images/button_battle3.png",
          fit: BoxFit.fill,
          color: Colors.black.withOpacity(0.4),
          ),
      ),
      GestureDetector(
        onTap: widget.tap,
        onTapDown: (details) {
          setState(() {
            pressed = true;
          });
        },
        onTapCancel: () {
          setState(() {
            pressed = false;
          });
        },
        child: Button1Opacity(
          opacity: widget.opacity,
          text: widget.text,
          fontsize: widget.fontsize,
          height: widget.height,
          pressed: pressed,
          ),
      )
    ],);

  }
}