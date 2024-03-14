
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarChartData()
    );

  }

  BarChartGroupData makeGroupData(int x ,double y){
    return BarChartGroupData(
      x:x,
      barRods: [
        BarChartRodData(
            toY: y,
          width: 15,
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,

                ],
                transform: const GradientRotation(pi / 40)
            ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,

            color: Colors.grey.shade300
          )

        )
      ]
    );

  }
  List<BarChartGroupData> showingGroups()=>List.generate(8, (i){
    switch(i){
      case 0:
        return makeGroupData(0,2);
      case 1:
        return makeGroupData(1,3);
      case 2:
        return makeGroupData(2,2);
      case 3:
        return makeGroupData(3,4.5);
      case 4:
        return makeGroupData(4,3.5);
      case 5:
        return makeGroupData(5,1.5);
      case 6:
        return makeGroupData(6,4);
      case 7:
        return makeGroupData(7,3.8);
      default:
        return throw Error();


    }

  });

  BarChartData mainBarChartData(){
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
        topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false)
        ),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
            reservedSize: 38,
              getTitlesWidget: getTiles
            )
        ),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 38,
                getTitlesWidget: leftTiles
            )
        )
      ),
      borderData: FlBorderData(
        show: false
      ),
      gridData: FlGridData(
        show:false
      ),
      barGroups: showingGroups()
    );




  }
  Widget getTiles(double value,TitleMeta meta){
    const style=TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14

    );
    Widget text;
    switch(value.toInt()){
      case 0:
        text= const Text('01',style:style);
        break;
      case 1:
        text= const Text('02',style:style);
        break;
      case 2:
        text= const Text('03',style:style);
        break;
      case 3:
        text= const Text('04',style:style);
        break;
      case 4:
        text= const Text('05',style:style);
        break;
      case 5:
        text= const Text('06',style:style);
        break;
      case 6:
        text= const Text('07',style:style);
        break;
      case 7:
        text= const Text('08',style:style);
        break;
      default:
        text= const Text('',style:style);
        break;
    }
    return SideTitleWidget(
        child: text,
        axisSide: meta.axisSide,
      space:16
    );
  }
  Widget leftTiles(double value,TitleMeta meta){
    const style=TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14

    );
   late String text;
    switch(value.toInt()){
      case 0:
        text= "\$ 1k";
        break;
      case 1:
        text= "\$ 2k";
        break;
      case 2:
        text= "\$ 3k";
        break;
      case 3:
        text= "\$ 4k";
        break;
      case 4:
        text= "\$ 5k";
        break;
      case 5:
        text= "\$ 6k";
        break;

      default:
        Container();
        break;
    }
    return SideTitleWidget(

        axisSide: meta.axisSide,
        space:0,
      child: Text(text, style:style),
    );
  }
}
