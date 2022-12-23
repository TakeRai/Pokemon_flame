import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatusRadar extends StatelessWidget{

  const StatusRadar({
    Key? key,
    required this.height
  }):super(
    key: key
  );

  final double height;

  @override
  Widget build(context){
    return SizedBox(
      height: height,
      child: RadarChart(
        RadarChartData(
          radarBorderData: BorderSide(color: Colors.white),
          tickBorderData: BorderSide(color: Colors.white),
          gridBorderData: BorderSide(color: Colors.white),
          dataSets: [
            RadarDataSet(
            fillColor: Colors.blue,
            dataEntries: [
              RadarEntry(value: 100),
              RadarEntry(value: 200),
              RadarEntry(value: 100),
              RadarEntry(value: 300),
              RadarEntry(value: 400),
              RadarEntry(value: 100)
            ]
          )],
          
        )
        ),
    );
  }
}