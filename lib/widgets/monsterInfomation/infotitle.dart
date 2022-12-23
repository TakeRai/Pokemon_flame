import 'package:flutter/material.dart';
import 'package:pokemon_flame/widgets/designedText.dart';

class InfoTitle extends StatelessWidget{

  const InfoTitle({
    Key? key,
    required this.availableHeight,
    required this.radius,
  }):super(
    key: key
  );

  final double availableHeight;
  final double radius;


  @override
  Widget build(context){
    
    return Container(
      height: availableHeight * 0.1,
      child: Stack(
        children: [
          Row(
            children: [
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius)
                ),
                child:  Image.asset(
                  "assets/images/fenrir_cut.jpeg",
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                ),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent
                ]
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ファイアドラゴン",style: desigedStyle(16),)
                ],
            ),
          ),
        ],
      )
    );
  }
}