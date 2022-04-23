// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class chartspage extends StatefulWidget {
  const chartspage({Key? key}) : super(key: key);

  @override
  State<chartspage> createState() => _State();
}

class _State extends State<chartspage> {
  //radial data
  List<radialData> chartData = [
    radialData(9000, 'Moodys'),
    radialData(2000, 'Usage'),
  ];
  // graph data
  List<graphdata> gData = [
    graphdata(5, 'Monday'),
    graphdata(10, 'Tuesday'),
    graphdata(0, 'Wednesday'),
    graphdata(-5, 'Thursday'),
    graphdata(5, 'Friday'),
    graphdata(10, 'Saturday'),
    graphdata(5, 'Sunday'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 230),
              child: Center(
                child: SfCircularChart(
                  backgroundColor: Colors.black,
                  title: ChartTitle(text: "Moody's Chart"),
                  legend: Legend(
                    isVisible: true,
                  ),
                  palette: const [
                    Colors.redAccent,
                    Color.fromARGB(255, 59, 65, 74)
                  ],
                  series: [
                    RadialBarSeries<radialData, String>(
                      radius: '55%',
                      innerRadius: '65%',
                      dataSource: chartData,
                      trackColor: Colors.grey.shade700,
                      gap: '18%',
                      cornerStyle: CornerStyle.bothCurve,
                      xValueMapper: (radialData data, _) => data.xData,
                      yValueMapper: (radialData data, _) => data.yData,
                    )
                  ],
                ),
              )),
          const Padding(
            padding: EdgeInsets.fromLTRB(100, 100, 0, 350),
            child: Text(
              "Welcome to Charts Page!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(.8),
            child: SfCartesianChart(
              title: ChartTitle(text: "Weekly Report"),
              legend: Legend(isVisible: true),
              series: <ChartSeries>[
                LineSeries<graphdata, num>(
                  dataSource: gData,
                  xValueMapper: (graphdata days, _) => days.xData,
                  yValueMapper: (graphdata mood, _) => mood.yData,
                )
              ],
              primaryXAxis:
                  NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
            ),
          )
        ],
      ),
    );
  }
}

class radialData {
  final num yData;
  final String xData;

  radialData(this.yData, this.xData);
}

class graphdata {
  final String xData;
  final num yData;
  graphdata(this.yData, this.xData);
}
