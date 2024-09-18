import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:uuid/uuid.dart'; // gera os uuid para os documentos de cada post
import 'package:app_listacompras/models/models.dart';
// com.ap08
void main() async{
  // evita que o app trave a tela antes de inicializar o banco de dados
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
//FirebaseFirestore firestore = FirebaseFirestore.instance; // cria uma instancia do banco de dados
//firestore.collection('Lista de compras').doc(Uuid().v1()).set({
 // "mês":"setembro",
 // "nome":"carne",
 // "qtde": 10,
//  "preço":50
//});
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App aula08"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.add),),
      body: ,
    );

    
  }
  showFormModal({Lista?model}){
    String title = "Adicionar lista";
    String confirmButton = "Salvar";
    String skipButton = "Cancelar";
    // variavel que vai armazenar o que for digitado
    TextEditingController nome_list = TextEditingController(); 
    if(model !=null){
      title= "Editando ${model.nome}";
      nome_list.text = model.nome;
    }
    // cria o formulário
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
      top: Radius.circular(24),
      ),
      ),
       builder: (context){
        return Container(
        height:  MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            // Titulo do form model e fonte grande
            Text(title,style: Theme.of(context).textTheme.bodyLarge,),
            TextFormField(
              controller: nome_list,
              decoration: InputDecoration(
                label: Text("Nome da lista"),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            
          ],

        ),
        );
       });


  }
}