import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogBox extends ConsumerStatefulWidget{
  const DialogBox({Key? key,required this.height,required this.child}):super(key: key);

  final double height;
  final Widget child;

  ConsumerState<DialogBox> createState() => DialogBoxState();
}

class DialogBoxState extends ConsumerState<DialogBox>{

  @override
  Widget build(context){
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration:  const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/dialog-plain.png"),
          centerSlice: Rect.fromLTRB(15, 15, 35, 35)
          ),
      ),
      child: widget.child,

    );
  }
}