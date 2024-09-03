import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {

  //Inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();

  Firestore.instance
      .collection("usuarios")
      .document("pontuacao")
      .setData({"Jamilton": "250", "Ana": "590"});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

