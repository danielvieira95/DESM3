import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//com.fireb
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
// cria uma instância do Firebase  e instancia ela na variavel firestore

/*firestore.collection("Testando firebase").doc().set({
"Funcionou?":true,
});
  firestore.collection("Vai Corinthians").doc("Campeão do mundo").set({
    "Funcionou?": true,
    "Maior artilheiro":"Ronaldo",
  });
  */
  
  /*firestore.collection("Lista_Compra").doc("Setembro").set({
  "nome":"Arroz",
  "qtde":5,
  "preço":25,
  
  });
  */
  /*firestore.collection("Produtos").doc("2LFINyptq0HeFErO3GZi").set({
   "nome":"Peixe",
  "qtde":3,
  "preço":35,
  
  });*/
 

    
 

  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> products = [
  {
    "nome": "Arroz",
    "qtde": 2,
    "preço": 30,
  },
  {
    "nome": "Carne",
    "qtde": 4,
    "preço": 50,
  },
   {
    "nome": "Feijao",
    "qtde": 7,
    "preço": 30,
  },
    {
    "nome": "Suco",
    "qtde": 2,
    "preço": 14.50,
  },
    {
    "nome": "Picanha",
    "qtde": 2,
    "preço": 35,
  },
   {
    "nome": "uva",
    "qtde": 1,
    "preço": 5,
  },
  
];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  _cadastrofire(){
    FirebaseFirestore.instance.collection('Sensores').add({
    "ID": "1B",
    "Temperatura": 28,
    "IDa":"1C",
    "Temperaturaa": 30,
  },);
 // firestore.collection("Produtos").doc("teste").set({'itens': products});
  print("Produtos postados");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Firebase'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Firebase",style: TextStyle(fontSize: 20),),
            ElevatedButton(onPressed: _cadastrofire        
            , child: Text('Cadastrar'))
          ],
        ),
      ),
    );
  }
}