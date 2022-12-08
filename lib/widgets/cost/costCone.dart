import 'package:flutter/widgets.dart';

class CostCone extends StatelessWidget{
  const CostCone({
    Key? key,
    required this.width
    }):super(key: key);

  final double width;

  @override
  Widget build(context){
    //間隔取るためか
    return Container(
      width: width,
      height: width,
      child: Center(
        child: SizedBox(width: width * 0.875,height: width * 0.875,
        child: Image.asset(
          "assets/images/costCone_green.png",
          fit: BoxFit.fill,),
          ),
      ),
    );

  }
}

class CostConeAnimated extends StatelessWidget{
  const CostConeAnimated({
    Key? key,
    required this.opacity,
    required this.width
    }):super(key: key);

  final double opacity;
  final double width;

  @override
  Widget build(context){
    return AnimatedOpacity(
      opacity: opacity, 
      duration: const Duration(milliseconds: 300),
      child: CostCone(
        width: width,
      ),
      );
  }
}

