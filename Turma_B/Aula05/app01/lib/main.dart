/*import 'dart:math';

import 'package:flutter/material.dart';
import 'package:knob_widget/knob_widget.dart';

void main() {
  runApp(MyApp());
}
// classe do tipo stateless
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Knob Demo',
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Knob Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _minimum = 0; // valor minimo do knob
  final double _maximum = 100; // valor máximo

  late KnobController _controller; // variavel para controle do knob
  late double _knobValue;
  // função para atualizar o valor do knob
  void valueChangedListener(double value) {
    if (mounted) {
      setState(() {
        _knobValue = value;
      });
    }
  }
  // override - polimorfismo para reescrever a função caso seja necessário
  @override
  // função initState carrega as variaveis na tela de forma automática
  void initState() {
    super.initState(); // construtor
    _knobValue = _minimum; // pega o valor minimo
    _controller = KnobController(
      initial: _knobValue, // valor inicial
      minimum: _minimum, // valor minimo
      maximum: _maximum, // valor máximo
      startAngle: 0, // angulo 0
      endAngle: 180, // angulo máximo
      precision: 2, // precisão de 2 em 2 graus
    );
    // adiciona o valor do knob
    _controller.addOnValueChangedListener(valueChangedListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Exibe o valor da variável do knob
            Text(_knobValue.toString()),
            const SizedBox(height: 25),
            // botão que seta o valor do knob de forma aleatória
            ElevatedButton(
              onPressed: () {
                var value =
                    Random().nextDouble() * (_maximum - _minimum) + _minimum;
                _controller.setCurrentValue(value);
              },
              child: const Text('Update Knob Value'),
            ),
            const SizedBox(height: 75),
            Container(
              // widget knob tem tamanho pré definido
              // width: 200
              // height 200
              child: Knob(
                controller: _controller,
                width: 200,
                height: 200,
                // style parametro de estilo do knob
                // KnobStyle - estilo do knob
                style: KnobStyle(
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  tickOffset: 5,
                  labelOffset: 10,
                  minorTicksPerInterval: 10,
                  showMinorTickLabels: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // função dispose carrega os valores
  void dispose() {
    _controller.removeOnValueChangedListener(valueChangedListener);
    super.dispose();
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:knob_widget/knob_widget.dart'; // pacote do knob

void main() {
  return runApp(GaugeApp());
}

/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  /// Creates the instance of MyHomePage
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        title: GaugeTitle(
            text: 'Speedometer',
            textStyle:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: 50)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: const Text('90.0',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 20),
          axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter Gauge')),
        body: _getGauge());
  }
}
// classe do knob
class Knobcomponente extends StatefulWidget {
  const Knobcomponente({super.key});

  @override
  State<Knobcomponente> createState() => _KnobcomponenteState();
}

class _KnobcomponenteState extends State<Knobcomponente> {
  final double _minimum = 0;
  final double _maximum = 100;
  late KnobController _controller;
  late double _knobValue;

  void valueChangedListener(double value) {
    if (mounted) {
      setState(() {
        _knobValue = value;
      });
    }
  }
   void initState() {
    super.initState();
    _knobValue = _minimum;
    _controller = KnobController(
      initial: _knobValue,
      minimum: _minimum,
      maximum: _maximum,
      startAngle: 0,
      endAngle: 180,
      precision: 2,
    );
    _controller.addOnValueChangedListener(valueChangedListener);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 75,
        child: Container(
              child: Knob(
                controller: _controller,
                width: 200,
                height: 200,
                style:KnobStyle(

                )
                
                
                
                ),
              ),
            ),),

      ],
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:knob_widget/knob_widget.dart'; // Atualize o pacote conforme necessário

void main() {
  runApp(GaugeApp());
}

/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gauge and Knob Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _gaugeValue = 50; // Valor inicial do gauge

  void _updateGaugeValue(double value) {
    setState(() {
      _gaugeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter Gauge & Knob')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: SfRadialGauge(
              title: GaugeTitle(
                text: 'Speedometer',
                textStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 150,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 50,
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10,
                    ),
                    GaugeRange(
                      startValue: 50,
                      endValue: 100,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10,
                    ),
                    GaugeRange(
                      startValue: 100,
                      endValue: 150,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(value: _gaugeValue),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Container(
                        child: Text(
                          '${_gaugeValue.toStringAsFixed(1)}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Knob(
            value: _gaugeValue,
            min: 0,
            max: 150, // Ajuste o máximo para corresponder ao máximo do gauge
            onChanged: (value) {
              setState(() {
                _gaugeValue = value;
              });
            },
            style: KnobStyle(
              borderColor: Colors.blue,
              needleColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

*/
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Knob and Gauge Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Knob and Gauge Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _minimum = 0; // Valor mínimo do knob
  final double _maximum = 100; // Valor máximo do knob

  late KnobController _controller; // Controlador do knob
  late double _knobValue; // Valor atual do knob

  // Função para atualizar o valor do knob
  void valueChangedListener(double value) {
    if (mounted) {
      setState(() {
        _knobValue = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _knobValue = _minimum; // Valor inicial do knob
    _controller = KnobController(
      initial: _knobValue, // Valor inicial
      minimum: _minimum, // Valor mínimo
      maximum: _maximum, // Valor máximo
      startAngle: 0, // Ângulo inicial
      endAngle: 180, // Ângulo final
      precision: 2, // Precisão do knob
    );
    _controller.addOnValueChangedListener(valueChangedListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Exibe o valor atual do knob
            Text('Knob Value: ${_knobValue.toStringAsFixed(2)}'),
            const SizedBox(height: 25),
            // Botão para definir um valor aleatório para o knob
            ElevatedButton(
              onPressed: () {
                var value =
                    Random().nextDouble() * (_maximum - _minimum) + _minimum;
                _controller.setCurrentValue(value);
              },
              child: const Text('Update Knob Value'),
            ),
            const SizedBox(height: 25),
            // Widget Knob
            Container(
              child: Knob(
                controller: _controller,
                width: 200,
                height: 200,
                // Estilo do knob
               
              ),
            ),
            const SizedBox(height: 25),
            // Widget Gauge
            SizedBox(
              height: 300,
              width: 300,
              child: SfRadialGauge(
                title: GaugeTitle(
                  text: 'Gauge',
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: _minimum,
                    maximum: _maximum,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Colors.orange,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(value: _knobValue),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            '${_knobValue.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeOnValueChangedListener(valueChangedListener);
    super.dispose();
  }
}


