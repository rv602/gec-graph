import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> chartData = [
    _SalesData('Jan', 2000),
    _SalesData('Feb', 3300),
    _SalesData('Mar', 2300),
    _SalesData('Apr', 1500),
    _SalesData('May', 1200)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your expenses'),
        ),
        body: Center(
            child: Container(
          height: 500,
          width: 320,
          //Initialize the chart widget
          child: SfCircularChart(
              // backgroundColor: Colors.white,
              onDataLabelRender: (DataLabelRenderArgs args) {
                double value = double.parse(args.text);
                args.text = value.toStringAsFixed(0);
              },
              series: <CircularSeries<_SalesData, String>>[
                PieSeries<_SalesData, String>(
                    selectionBehavior: SelectionBehavior(enable: true),
                    explode: true,
                    dataSource: chartData,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                    ))
              ]),
        )));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
