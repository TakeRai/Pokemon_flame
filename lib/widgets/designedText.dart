
import 'package:flutter/material.dart';

TextStyle desigedStyle(
  double fontsize,
){
  return  TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "dot",
          fontSize: fontsize,
          color: Colors.white,
          shadows: const [
            Shadow( // bottomLeft
              offset: Offset(-1.5, -1.5),
              color: Colors.black
            ),
            Shadow( // bottomRight
              offset: Offset(1.5, -1.5),
              color: Colors.black
            ),
            Shadow( // topRight
              offset: Offset(1.5, 2.5),
              color: Colors.black
            ),
            Shadow( // topLeft
              offset: Offset(-1.5, 2.5),
              color: Colors.black
            ),
          ]
        );
}