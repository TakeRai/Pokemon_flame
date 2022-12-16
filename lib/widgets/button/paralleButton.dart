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

  bool pressed = false;

  @override
  Widget build(context){
    return Stack(
      children: [
        Container(
          height: widget.width/2,
          width: widget.width,
          margin: EdgeInsets.only(top: widget.width/50,left: widget.width/50),
          child: Image.asset("assets/images/button/button_orange.png",color: Colors.black.withOpacity(0.5),
          ),
          ),
        
        GestureDetector(
          onTap: widget.onTap,
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
         
          child: Container(
            height: widget.width/2,
            width: widget.width,
            margin: EdgeInsets.only(top: pressed ? widget.width/50 : 0,left: pressed ? widget.width/50 : 0),
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/button/button_orange.png")
                ,fit: BoxFit.fill,
                colorFilter: pressed ? ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.srcATop) : null
              )
            ),
            // child: Stack(children: [
            //   Image.asset(
            //     "assets/images/button/button_orange.png",
            //     width: widget.width,
            //     height: widget.width/2,
            //     fit: BoxFit.fill,
            //   ),
            //   Center(
            //   child: Text(
            //     widget.text,
            //     style: desigedStyle(widget.fontSize),
            //   ),
            // ),
            // ]),
            child: Center(
              child: Text(
                widget.text,
                style: desigedStyle(widget.fontSize),
              ),
            ),
          ),
        )
      ],
    );

  }
}