import 'package:fl_boxes/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesScreen extends StatefulWidget {
   
  const GraficasCircularesScreen({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesScreen> createState() => _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {

  double porcentaje=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.orange,),
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue,),
              ],
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.brown,),
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink,),
              ],
             )
           ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          porcentaje+=10;
          if (porcentaje>100) {
            porcentaje=0;
          }
        });
      }, child: Icon(Icons.add),),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    super.key,
    required this.porcentaje, required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 180,
     width: 180,
     // child: Text('$porcentaje%' ,style: TextStyle(fontSize: 40.0),),
     child: RadialProgress(
       porcentaje:porcentaje,
       colorPrimario:color,
     ),
    );
  }
}