import 'package:app_restaurante/screen/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PanucciRestaurante());
}

class PanucciRestaurante extends StatelessWidget {
  const PanucciRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pannuci Restaurante",
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      home: Home(),
    );
  }
}