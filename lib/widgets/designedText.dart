
import 'package:flutter/material.dart';

TextStyle desigedStyle(
  double fontsize,
  {
    double letter = 1
  }
){
  return  TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "dot",
          letterSpacing: letter,
          fontSize: fontsize,
          color: Colors.white,
          shadows: const [
            Shadow( // bottomLeft
              offset: Offset(-1, -1),
              color: Colors.black
            ),
            Shadow( // bottomRight
              offset: Offset(1, -1),
              color: Colors.black
            ),
            Shadow( // topRight
              offset: Offset(1, 1.6),
              color: Colors.black
            ),
            Shadow( // topLeft
              offset: Offset(-1, 1.6),
              color: Colors.black
            ),

            Shadow(
              offset: Offset(0, -1),
              color: Colors.black
            ),
            Shadow(
              offset: Offset(-1.5, 0),
              color: Colors.black
            ),
            Shadow(
              offset: Offset(1.5, 0),
              color: Colors.black
            ),
            Shadow(
              offset: Offset(0, 1.5),
              color: Colors.black
            ),
          ]
        );
}