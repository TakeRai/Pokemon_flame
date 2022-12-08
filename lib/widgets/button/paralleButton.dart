import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class ParalleButton extends ConsumerStatefulWidget{

  final double fontSize;
  final String text;
  final double width;
  final void Function()? onTap;

  const ParalleButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.fontSize,
    required this.width,
  }):super(key: key);

  @override
  ConsumerState<ParalleButton> createState() => ParalleButtonState();
}

class ParalleButtonState extends ConsumerState<ParalleButton>{

  @override
  Widget build(context){
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.width/2,
        width: widget.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/button/button_orange.png")
            ,fit: BoxFit.fill
          )
        ),
        child: Center(
          child: Text(
            widget.text,
            style: desigedStyle(widget.fontSize),
          ),
        ),
      ),
    );

  }
}