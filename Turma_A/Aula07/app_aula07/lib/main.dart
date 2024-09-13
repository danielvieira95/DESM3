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

  runApp(MaterialApp(
    home:  Home(),
  ));
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
  TextEditingController nomeprod = TextEditingController();
    TextEditingController qtde = TextEditingController();
    TextEditingController valor = TextEditingController();

  _postFirebase(){
    firestore.collection('Produtos').doc().set({"Nome": nomeprod.text,
    "Qtde": qtde.text,
    "Valor": valor.text
  });
    nomeprod.text="";
    qtde.text="";
    valor.text="";
  }
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    final width = mediaquery.width;
    final height = mediaquery.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("App aula 07 - Firebase"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App Firebase',style: TextStyle(fontSize: 18),),
            SizedBox(
              child:  TextFormField(
              controller: nomeprod,
             keyboardType: TextInputType.name,
             decoration: InputDecoration(
              hintText: "Digite o nome do produto",
              
              border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8)),
             )),
             width: width/2,
             height: height/8,
            ),
             SizedBox(
              child:  TextFormField(
              controller: qtde,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
              hintText: "Digite a qtde do produto",
              
              border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8)),
             )),
             width: width/2,
             height: height/8,
            ),
             SizedBox(
              child:  TextFormField(
              controller: valor,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
              hintText: "Digite o valor do produto",
              
              border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8)),
             )),
             width: width/2,
             height: height/8,
            ),
            
            
           

            
            ElevatedButton(onPressed: _postFirebase, child: Text('Enviar')),
            ElevatedButton(onPressed: (){
              print(mediaquery);
              print(width);
               print(height);
            }, child: Text('Tela')),
          ],
        ),
      ),

    );
  }
}