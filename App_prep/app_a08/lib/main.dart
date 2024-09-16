import 'package:app_a08/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // pacote para permitir a conexão com o banco de dados

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // impede que o app de erro ao inicializar

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;// variavel para criar a instância do banco de dados
  TextEditingController nomeprod = TextEditingController();
  TextEditingController qtde = TextEditingController();
  TextEditingController valor = TextEditingController();
  // Função para postar os dados no Firebase

  _postFirebase(){
    firestore.collection("Produtos").doc().set({
      "Nome":nomeprod.text, "Qtde":qtde.text,
      "Valor": valor.text
    });
    nomeprod.text="";
    qtde.text = "";
    valor.text = "";
  }
  @override  
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    final width = mediaquery.width;
    final height = mediaquery.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("App Firebase A08"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextFormField(
                controller:  nomeprod,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                hintText: "Digite o nome do produto",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                ),
              ),
            width: width/2,
            height: height/8,
            ),
            SizedBox(
              child: TextFormField(
                controller: qtde,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Digite a quantidade do produto",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              width: width / 2,
              height: height / 8,
            ),
            SizedBox(
              child: TextFormField(
                controller: valor,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Digite o preço do produto",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              width: width / 2,
              height: height / 8,
            ),
            ElevatedButton(onPressed: _postFirebase, child: Text("Salvar"))
             
          ],
        ),
      ),
    );
  }
}