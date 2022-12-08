import 'package:flutter/material.dart';

class Ripple extends StatefulWidget {
  Ripple({Key? key, required this.offset,required this.duration}):
  super(key: key);

  final Offset offset;
  final Duration duration;

  State<Ripple> createState() => _RippleState();
}

class _RippleState extends State<Ripple>with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context){
    return CustomPaint(
      painter: RipplePainter(controller: controller, offset: widget.offset),
    );
  }

  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this,duration: widget.duration);
    controller.repeat();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}

class RipplePainter extends CustomPainter{
  RipplePainter({required this.controller,required this.offset})
  : super(repaint: controller);

  final Offset offset;
  final Animation<double> controller;

  @override
  void paint(Canvas canvas, Size size){
    final circleValue = Tween<double>(begin: 50,end: 80)
        .animate(controller.drive(CurveTween(curve: Curves.easeOutExpo))).value;

    final widthValue = Tween<double>(begin: 7,end:3 )
        .animate(controller.drive(CurveTween(curve: Curves.easeOutExpo))).value;

    final opacityValue = Tween<double>(begin: 1,end: 0)
        .animate(controller.drive(CurveTween(curve: Curves.easeOutExpo))).value;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Color(0xffFFCD0D).withOpacity(opacityValue)
      ..strokeWidth = widthValue;

    canvas.drawCircle(offset, circleValue, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
