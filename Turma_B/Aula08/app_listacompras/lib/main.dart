import 'package:app_listacompras/auth.dart';
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
    home: Auth(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // instancia o firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Lista> listLista=[]; // lista para armazenar os dados enviados ao firebase
  _refresh()async{
    List<Lista>temp = []; // cria uma variavel vazia
    // vai armazenar os dados do firebase em snapshot
   QuerySnapshot<Map<String,dynamic>>snapshot = await firestore.collection("Listacompras").get();
   for(var doc in snapshot.docs){
    temp.add(Lista.fromMap(doc.data()));
   }
    setState(() {
      listLista = temp;
    });
  }
  // função que irá apagar um item do banco de dados
  void remove(Lista model){
   firestore.collection("Listacompras").doc(model.id).delete();
   _refresh();
  }
  @override
  void initState() {
    _refresh();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App aula08"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showFormModal();
      },
      child: Icon(Icons.add),),
      body: (listLista.isEmpty)?Center(
        child: Text("Não temos listas salvas \n Vamos criar a primeira ?",
        textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),

        

      ):RefreshIndicator(
        // vai chamar uma função que atualiza os itens da lista
        onRefresh: (){
        return _refresh();
        },
        child: ListView(
          children:List.generate(
            listLista.length,
            (index){
               Lista model = listLista[index];
               // Dimissible comando para deslizar o elemento da lista
               return Dismissible(
                key: ValueKey<Lista>(model), 
                // direção do fim para o começo
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child:Padding(
                    padding: EdgeInsets.only(right: 8.0,) ,
                    child: Icon(Icons.delete,color: Colors.white,),
                ),),
                onDismissed:(direction){
                  remove(model);
                } ,
                
                child: ListTile(
                onTap: (){
                _refresh();
                },
                onLongPress: (){
                  showFormModal(model:model);
                 
                },
                leading: Icon(Icons.list_alt_rounded),
                title: Text(model.nome),
                subtitle: Text(model.id),
                ),
                );
              // Para excluir a lista
  })),
      ),);

    
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed:(){
                  Navigator.pop(context);
                } , child: Text(skipButton)),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: (){
                // cria uma variavel compra do tipo lista
                Lista compra = Lista(id: Uuid().v1(), nome: nome_list.text);
                // no caso de editar uma lista verifica se o model não está vazio
                if(model!=null){
                  compra.id = model.id;
                }
                firestore.collection("Listacompras").doc(compra.id).set(compra.toMap());
                _refresh();
                Navigator.pop(context);
                }, child: Text(confirmButton)),

              ],
            )
          ],

        ),
        );
       });


  }
}