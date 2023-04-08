import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimatedScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
         child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller=new AnimationController(
      vsync: this,
      duration: Duration(milliseconds:4000 )
    );
    rotacion=Tween(begin: 0.0, end: 2.0* Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );

    opacity=Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, .25, curve: Curves.easeOut))
    );

    opacityOut=Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    moverDerecha=Tween(begin: 0.0, end: 180.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );

    agrandar=Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );

    controller.addListener(() {
      if (controller.status==AnimationStatus.completed) {
        controller.reset();
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //Inicio de la animación-PLAY
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale:agrandar.value,
                child: child
              ),
            )
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}