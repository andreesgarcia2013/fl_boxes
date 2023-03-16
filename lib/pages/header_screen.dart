import 'package:fl_boxes/widgets/header.dart';
import 'package:flutter/material.dart';

class HeaderScreen extends StatelessWidget {
   
  const HeaderScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HeaderWave(),
    );
  }
}