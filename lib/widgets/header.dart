import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.indigo,
    );
  }
}

class HeaderBorderRadius extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60))
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint =Paint();

    //Propiedades
    paint.color=Colors.indigo;
    paint.style=PaintingStyle.fill;
    paint.strokeWidth=2;

    final path= new Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height*0.3);
    path.lineTo(size.width, size.height*0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderDiagonalPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderDiagonalPainter oldDelegate) => false;
}

class HeaderTriangular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint =Paint();

    //Propiedades
    paint.color=Colors.indigo;
    paint.style=PaintingStyle.fill;
    paint.strokeWidth=2;

    final path= new Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);

    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderTriangularPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderTriangularPainter oldDelegate) => false;
}

class HeaderPico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint =Paint();

    //Propiedades
    paint.color=Colors.indigo;
    paint.style=PaintingStyle.fill;
    paint.strokeWidth=2;

    final path= new Path();

    //Dibujar con el path y el lapiz
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height*0.2);
    path.lineTo(size.width*0.5, size.height*0.3);
    path.lineTo(0, size.height*0.2);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);

    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderPicoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderPicoPainter oldDelegate) => false;
}

class HeaderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint =Paint();

    //Propiedades
    paint.color=Colors.indigo;
    paint.style=PaintingStyle.stroke;
    paint.strokeWidth=2;

    final path= new Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height*0.2);
    path.quadraticBezierTo(size.width*0.5, size.height*0.1, size.width, size.height*0.2);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);

    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderCurvoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderCurvoPainter oldDelegate) => false;
}

class HeaderWave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =new Rect.fromCircle(center: Offset(200,165), radius: 180);
    final Gradient gradient=new LinearGradient(colors: [
      Colors.red,
      Colors.orange,
      Colors.amber
    ]);
    final paint =Paint()..shader=gradient.createShader(rect);

    //Propiedades
    paint.color=Colors.indigo;
    paint.style=PaintingStyle.fill;
    paint.strokeWidth=2;

    final path= new Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height*0.3);
    path.quadraticBezierTo(size.width*0.25, size.height*0.45, size.width*0.50, size.height*0.30);
    path.quadraticBezierTo(size.width*0.77, size.height*0.12, size.width, size.height*0.3);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);

    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderWavePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderWavePainter oldDelegate) => false;
}