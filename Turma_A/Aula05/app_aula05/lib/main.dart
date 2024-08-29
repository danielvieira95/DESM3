import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Knob e Gauge'),
      ),
      body: Column(
        children: [
          
        ],
      ),

    )
  }
}