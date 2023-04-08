import 'package:fl_boxes/challenge/cuadrado_animado_screen.dart';
import 'package:fl_boxes/pages/animated_screen.dart';
import 'package:fl_boxes/pages/graficas_circulares_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: GraficasCircularesScreen()
    );
  }
}