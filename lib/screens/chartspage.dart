import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class chartspage extends StatefulWidget {
  const chartspage({Key? key}) : super(key: key);

  @override
  State<chartspage> createState() => _State();
}

class _State extends State<chartspage> {
  List<radialData> chartData = [
    radialData(9000, 'akshit'),
    radialData(2000, 'akshit'),
    radialData(5000, 'akshit'),
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 230),
              child: SfCircularChart(
                backgroundColor: Colors.black,
                legend: Legend(isVisible: true),
                palette: const [Colors.redAccent, Colors.blue, Colors.purple],
                series: [
                  RadialBarSeries<radialData, String>(
                    radius: '55%',
                    innerRadius: '50%',
                    dataSource: chartData,
                    trackColor: Colors.grey.shade700,
                    gap: '3%',
                    cornerStyle: CornerStyle.bothCurve,
                    xValueMapper: (radialData data, _) => data.xData,
                    yValueMapper: (radialData data, _) => data.yData,
                  )
                ],
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(100, 100, 0, 350),
              child: Text(
                "Welcome to Charts Page!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
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
