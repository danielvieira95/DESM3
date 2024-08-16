import 'package:appcardapiorestaurante/screens/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PannuciRestaurante());
}

class PannuciRestaurante extends StatelessWidget {
  const PannuciRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(colorSchemeSeed: Colors.purple,useMaterial3: true),
     home:Home(),
    );
  }
}