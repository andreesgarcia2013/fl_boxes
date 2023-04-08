import 'dart:math';

import 'package:flutter/material.dart';
class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecondary;
  final double grosorPrimary;
  final double grosorSecondary;

  const RadialProgress({required this.porcentaje,  this.colorPrimario=Colors.blue, this.colorSecondary=Colors.grey, this.grosorSecondary=4.0, this.grosorPrimary=10.0});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior=widget.porcentaje;
    controller=new AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar=widget.porcentaje-porcentajeAnterior;
    porcentajeAnterior=widget.porcentaje;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress((widget.porcentaje-diferenciaAnimar)+(diferenciaAnimar*controller.value), widget.colorPrimario, widget.colorSecondary, widget.grosorSecondary, widget.grosorPrimary),
          ),
        );
      },
    );
    
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecondary;
  final double grosorSecondary;
  final double grosorPrimary;
  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecondary, this.grosorSecondary, this.grosorPrimary);
  @override
  void paint(Canvas canvas, Size size) {
    
    // TODO: implement paint
    final paint =new Paint()
    ..strokeWidth=grosorSecondary
    ..color=Colors.grey
    ..style=PaintingStyle.stroke;

    final Offset center=new Offset(size.width*0.5, size.height*0.5);
    final double radio=min(size.width*0.5, size.height*0.5);
    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco =new Paint()
    ..strokeWidth=grosorPrimary
    ..color=colorPrimario
    ..strokeCap=StrokeCap.round
    ..style=PaintingStyle.stroke;

    //Parte que se debe llenar

    double arcAngle=2*pi*(porcentaje/100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;
  
}