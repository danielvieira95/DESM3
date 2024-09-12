import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // dependencia
// do cloud firestore
//com.firea

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // pré carrega a tela no app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
// criando a instancia do firebase 
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
// f

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Firebase',
      theme: ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  // instancia firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _postFirebase(){
    firestore.collection('Produtos').doc().set({"Nome": "PS5",
    "Qtde": 10,
    "Valor": 3500.00
  });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App aula 07 - Firebase"),
      ),
      body: Column(
        children: [
          Text('App Firebase',style: TextStyle(fontSize: 18),),
          ElevatedButton(onPressed: _postFirebase, child: Text('Enviar'))
        ],
      ),

    );
  }
}