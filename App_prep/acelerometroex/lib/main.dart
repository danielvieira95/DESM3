import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AccelerometerApp(),
    );
  }
}

class AccelerometerApp extends StatefulWidget {
  const AccelerometerApp({super.key});

  @override
  State<AccelerometerApp> createState() => _AccelerometerAppState();
}

class _AccelerometerAppState extends State<AccelerometerApp> {
  double x = 0.0, y = 0.0, z = 0.0;
  late StreamSubscription<AccelerometerEvent> _streamSubscription;

  final List<FlSpot> _xData = [];
  final List<FlSpot> _yData = [];
  final List<FlSpot> _zData = [];
  int _time = 0;
  final int maxDataPoints = 50;

  @override
  void initState() {
    super.initState();
    _streamSubscription = accelerometerEvents.listen((event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;

        _xData.add(FlSpot(_time.toDouble(), x));
        _yData.add(FlSpot(_time.toDouble(), y));
        _zData.add(FlSpot(_time.toDouble(), z));

        if (_xData.length > maxDataPoints) _xData.removeAt(0);
        if (_yData.length > maxDataPoints) _yData.removeAt(0);
        if (_zData.length > maxDataPoints) _zData.removeAt(0);

        _time++;
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acelerômetro com Gráficos"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Valores do Acelerômetro",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: _xData,
                      isCurved: true,
                      barWidth: 2,
                      color: Colors.red,
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(show: false),
                    ),
                    LineChartBarData(
                      spots: _yData,
                      isCurved: true,
                      barWidth: 2,
                      color: Colors.green,
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(show: false),
                    ),
                    LineChartBarData(
                      spots: _zData,
                      isCurved: true,
                      barWidth: 2,
                      color: Colors.blue,
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) => Text(
                          value.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    drawHorizontalLine: true,
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey,
                        strokeWidth: 0.5,
                      );
                    },
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey,
                        strokeWidth: 0.5,
                      );
                    },
                  ),
                 lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      tooltipRoundedRadius: 8,
                      tooltipPadding: const EdgeInsets.all(8),
                      tooltipMargin: 8,
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      tooltipBorder:
                          BorderSide(color: Colors.blueAccent, width: 1),                          
                      
                      getTooltipItems: (touchedSpots) {
                        if (touchedSpots == null) {
                          return [];
                        }
                        return touchedSpots.map((spot) {
                          return LineTooltipItem(
                            'X: ${spot.x.toStringAsFixed(2)}\nY: ${spot.y.toStringAsFixed(2)}',
                            const TextStyle(color: Colors.white),
                          );
                        }).toList();
                      },
                    ),
                  
                    handleBuiltInTouches: true,
                  ),

                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("X: ${x.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18, color: Colors.red)),
                Text("Y: ${y.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18, color: Colors.green)),
                Text("Z: ${z.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18, color: Colors.blue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
