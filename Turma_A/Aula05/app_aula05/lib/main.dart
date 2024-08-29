import 'package:flutter/material.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(App_Knob());
}

class App_Knob extends StatelessWidget {
  const App_Knob({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Aula05 - Knob",
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double _minimo =0; // variaveis para o knob
  final double _maximo =0;  // variaveis para o knob

  late KnobController controller; // variavel para controle
  // do knob
  late double _knobvalue;  // valor atual do knob
   // Função para atualizar o valor do knob
  void valueChangedListener(double value) {
    if (mounted) {
      setState(() {
        _knobvalue = value;
      });
    }
  } 
  @override
    void initState() {
    super.initState();
    _knobvalue = _minimo; // Valor inicial do knob
    controller = KnobController(
      initial: _knobvalue, // Valor inicial
      minimum: _minimo, // Valor mínimo
      maximum: _maximo, // Valor máximo
      startAngle: 0, // Ângulo inicial
      endAngle: 180, // Ângulo final
      precision: 2, // Precisão do knob
    );
    controller.addOnValueChangedListener(valueChangedListener);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Knob e Gauge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Knob value: ${_knobvalue.toStringAsFixed(2)}'),
            ElevatedButton(onPressed: (){
        
            }, child: Text('Knob Value')),
            Container(
              // Widget knob
              child: Knob(
                controller: controller,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              // SFRadialGauge - elemento Gauge
              child: SfRadialGauge(
                title: GaugeTitle(
                  text: 'Knob Value',
                  textStyle: TextStyle(fontSize: 20.0,
                  fontWeight:FontWeight.bold ),
                  ),
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: _minimo,
                      maximum: _maximo,
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
                             startWidth:10 ,
                             endWidth: 10,),                           
                      ],
                      pointers:<GaugePointer> [
                        NeedlePointer(
                          // value - variavel do gauge
                          // _knobvalue - variavel do knob
                        value: _knobvalue,
                        ),

                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Text('${_knobvalue.toStringAsFixed(1)}',
                            style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.bold),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5,
                          ),

                      ],
                    ),


                  ],


              ),
            )
        
          ],
        ),
      ),
  
    );     
  }
   @override
   // função para atualizar o gauge conforme o knob se movimenta
  void dispose() {
    controller.removeOnValueChangedListener(valueChangedListener);
    super.dispose();

  }
 
}